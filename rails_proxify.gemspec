lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_proxify/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_proxify'
  spec.version       = RailsProxify::VERSION
  spec.authors       = ['Vitaliy Kovalenko']
  spec.email         = ['kovalenko.v92@gmail.com']

  spec.summary       = %q{Proxify all your http requests from browser.}
  spec.description   = %q{Proxify all your http requests from browser to talk to remote servers using json.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
