# -*- encoding: utf-8 -*-
# stub: jsonify 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jsonify"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bill Siggelkow"]
  s.date = "2012-09-12"
  s.description = "Turn Ruby objects into JSON -- correctly!"
  s.email = ["bsiggelkow@me.com"]
  s.homepage = "http://github.com/bsiggelkow/jsonify"
  s.rubyforge_project = "jsonify"
  s.rubygems_version = "2.4.5"
  s.summary = "Turn Ruby objects into JSON"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<tilt>, ["~> 1.3.2"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<rdiscount>, [">= 0"])
    else
      s.add_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<tilt>, ["~> 1.3.2"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<rdiscount>, [">= 0"])
    end
  else
    s.add_dependency(%q<multi_json>, ["~> 1.3"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<tilt>, ["~> 1.3.2"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<rdiscount>, [">= 0"])
  end
end
