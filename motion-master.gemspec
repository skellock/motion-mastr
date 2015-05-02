# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-mastr/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "motion-mastr"
  spec.version       = MotionMastr::VERSION
  spec.authors       = ["Steve Kellock"]
  spec.email         = ["steve@kellock.ca"]
  spec.description   = "Get your NSMutableAttributedString on!"
  spec.summary       = "Inferior to CoreText and HTML, it's Attributed Strings!  You'll always be 3rd place in Apple's heart.  Now you can share the bronze medal with NSMutableAttributedString in RubyMotion!"
  spec.homepage      = "https://github.com/skellock/motion-mastr"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
