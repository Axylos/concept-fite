# -*- encoding: utf-8 -*-
# stub: protocol-http1 0.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "protocol-http1".freeze
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Williams".freeze]
  s.date = "2019-10-24"
  s.email = ["samuel.williams@oriontransfer.co.nz".freeze]
  s.homepage = "https://github.com/socketry/protocol-http1".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A low level implementation of the HTTP/1 protocol.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<protocol-http>.freeze, ["~> 0.13"])
    s.add_development_dependency(%q<covered>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rspec-memory>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<rspec-files>.freeze, ["~> 1.0"])
  else
    s.add_dependency(%q<protocol-http>.freeze, ["~> 0.13"])
    s.add_dependency(%q<covered>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-memory>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rspec-files>.freeze, ["~> 1.0"])
  end
end
