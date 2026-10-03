# typed: strict
# frozen_string_literal: true

require "cask/cask_loader"
require "cask/auditor"
require "tmpdir"

Homebrew.raise_deprecation_exceptions = true

paths = Pathname(__dir__).parent.glob("{Casks,Deprecated}/*.rb")
cleanup_tokens = %w[
  adobedownloader alma antigravity-tools claude-island cradle easylpac lookinside
  mitori notchdrop ocs-desktop pastemd pcl-refactor sentry type4me
]

[:arm, :intel].each do |arch|
  Homebrew::SimulateSystem.with(os: :macos, arch:) do
    paths.each do |path|
      cask = Cask::CaskLoader::FromContentLoader.new(path.read).load(config: nil)
      raise "#{path}: token does not match filename" if cask.token != path.basename(".rb").to_s

      errors = Cask::Auditor.audit(cask, audit_strict: true)
      raise "#{path}: #{errors.inspect}" unless errors.empty?

      # Round-trip through JSON to check the metadata that the API serves.
      artifacts = JSON.parse(JSON.generate(cask.to_h)).fetch("artifacts")
      flight = artifacts.find { |artifact| artifact.key?("preflight_steps") }
      raise "#{path}: unexpected cleanup hook" if flight.nil? == cleanup_tokens.include?(cask.token)
      next unless flight

      steps = flight.fetch("preflight_steps").first.fetch("steps")
      app = artifacts.find { |artifact| artifact.key?("app") }.fetch("app").first
      expected_steps = [
        { "type" => "run", "command" => { "path" => "/usr/bin/xattr" },
          "args" => ["-cr", "{{staged_path}}/#{app}"] },
      ]
      raise "#{path}: unexpected cleanup command" if steps != expected_steps

      Dir.mktmpdir("cask-steps-", HOMEBREW_CACHE) do |directory|
        staged_path = Pathname(directory)
        payload = staged_path/app/"Contents/payload"
        payload.dirname.mkpath
        payload.write("test")
        SystemCommand.run!("/usr/bin/xattr", args: ["-w", "com.homebrew-star.test", "test", payload])
        SystemCommand.run!("/usr/bin/xattr", args: ["-w", "com.apple.quarantine", "0081;00000000;Homebrew;", payload])
        context = Struct.new(:staged_path).new(staged_path)
        Homebrew::InstallSteps::Runner.new(context:).run(steps)
        attrs = SystemCommand.run!("/usr/bin/xattr", args: [payload]).stdout
        if attrs.include?("com.homebrew-star.test") ||
           attrs.include?("com.apple.quarantine") || payload.read != "test"
          raise "#{path}: cleanup did not run"
        end
      end
    end
  end
end

puts "#{paths.length} casks audited on ARM and Intel; " \
     "#{cleanup_tokens.length} cleanup hooks executed on temporary bundles per architecture."
