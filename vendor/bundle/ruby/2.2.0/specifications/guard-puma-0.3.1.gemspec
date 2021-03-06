# -*- encoding: utf-8 -*-
# stub: guard-puma 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "guard-puma"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jesse Cooke"]
  s.date = "2014-11-11"
  s.email = ["jesse@jc00ke.com"]
  s.homepage = "https://github.com/jc00ke/guard-puma"
  s.rubygems_version = "2.4.5"
  s.summary = "Restart puma when files change"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, ["~> 2.8"])
      s.add_runtime_dependency(%q<puma>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 10.2"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 4.3.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<guard>, ["~> 2.8"])
      s.add_dependency(%q<puma>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 10.2"])
      s.add_dependency(%q<rspec>, ["~> 3.1.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 4.3.0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<guard>, ["~> 2.8"])
    s.add_dependency(%q<puma>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 10.2"])
    s.add_dependency(%q<rspec>, ["~> 3.1.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 4.3.0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
