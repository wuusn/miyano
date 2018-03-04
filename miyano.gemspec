lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "miyano/version"

Gem::Specification.new do |spec|
  spec.name          = "miyano"
  spec.version       = Miyano::VERSION
  spec.authors       = ["wuusn"]
  spec.email         = ["wuusin@gmail.com"]

  spec.summary       = %q{A BearNote Blog system depoly on Github Pages.}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber", "~> 3.1.0"
  spec.add_development_dependency "aruba", "~> 0.14.3"

  spec.add_dependency "thor", "~> 0.20.0"
  spec.add_dependency "sass", "~> 3.5.5"
  spec.add_dependency "tilt", "~> 2.0.8"
  spec.add_dependency "rubyzip", "~> 1.2.1"
  spec.add_dependency "rouge", "~> 3.1.1"
  spec.add_dependency "beardown", "0.1.2"
end
