# -*- encoding: utf-8 -*-
# stub: async-pool 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "async-pool".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Williams".freeze]
  s.date = "2019-12-22"
  s.email = ["samuel.williams@oriontransfer.co.nz".freeze]
  s.homepage = "https://github.com/socketry/async-pool".freeze
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A Redis client library.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<async>.freeze, ["~> 1.8"])
    s.add_development_dependency(%q<async-rspec>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<covered>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<async>.freeze, ["~> 1.8"])
    s.add_dependency(%q<async-rspec>.freeze, ["~> 1.1"])
    s.add_dependency(%q<covered>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
