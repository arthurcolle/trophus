# -*- encoding: utf-8 -*-
# stub: piwik_analytics 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "piwik_analytics"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Fabian Becker"]
  s.date = "2012-10-10"
  s.description = "    The piwik_analytics gem provides an easy way to include Piwik into your application.\n    By default it will output the synchronous piwik tracking code for every page\n    (given that it is configured correctly).    \n"
  s.email = "halfdan@xnorfz.de"
  s.homepage = "https://github.com/halfdan/piwik_analytics/"
  s.rubygems_version = "2.4.5"
  s.summary = "[Rails] Easily include Piwik tracking in your Rails application."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<actionpack>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<actionpack>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
