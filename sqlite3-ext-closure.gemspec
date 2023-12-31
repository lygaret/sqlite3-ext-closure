# frozen_string_literal: true

lib = File.expand_path("./lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sqlite3_ext_closure/version"

Gem::Specification.new do |spec|
  spec.name    = "sqlite3-ext-closure"
  spec.version = SQLite3::Ext::Closure::VERSION
  spec.authors = ["Jon Raphaelson"]
  spec.email   = ["jon@accidental.cc"]

  spec.summary = "The `closure.c` extension for SQLite, packaged as a gem."
  spec.homepage = "https://github.com/lygaret/sqlite3-extension-gems"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end

  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/closure/extconf.rb"]

  spec.add_dependency "sqlite3", "~> 1"
  spec.metadata["rubygems_mfa_required"] = "true"
end
