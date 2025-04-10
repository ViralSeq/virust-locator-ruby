# frozen_string_literal: true

require_relative "lib/virust_locator/version"

Gem::Specification.new do |spec|
  spec.name = "virust-locator-ruby"
  spec.version = VirustLocator::VERSION
  spec.authors = ["Shuntai Zhou"]
  spec.email = ["shunta.zhou@gmail.com"]

  spec.summary = "Wrapper for viRust-locator, a Rust API for simplied LANL HIV Locator tool."
  spec.description = "Wrapper for viRust-locator, a Rust API for simplied LANL HIV Locator tool."
  spec.homepage = "https://github.com/ViralSeq/virust-locator-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "shellwords", "~> 0.2"
end
