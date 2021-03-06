# -*- encoding: utf-8 -*-
# stub: geokit-rails 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "geokit-rails"
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael Noack", "Andre Lewis", "Bill Eisenhauer", "Jeremy Lecour"]
  s.date = "2015-03-11"
  s.description = "Official Geokit plugin for Rails/ActiveRecord. Provides location-based goodness for your Rails app. Requires the Geokit gem."
  s.email = ["michael+geokit@noack.com.au", "andre@earthcode.com", "bill_eisenhauer@yahoo.com", "jeremy.lecour@gmail.com"]
  s.homepage = "http://github.com/geokit/geokit-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Geokit helpers for rails apps."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0"])
      s.add_runtime_dependency(%q<geokit>, ["~> 1.5"])
      s.add_development_dependency(%q<bundler>, ["> 1.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<simplecov-rcov>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<mysql>, ["~> 2.8"])
      s.add_development_dependency(%q<mysql2>, ["~> 0.2"])
      s.add_development_dependency(%q<activerecord-mysql2spatial-adapter>, [">= 0"])
      s.add_development_dependency(%q<pg>, ["~> 0.10"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<geokit>, ["~> 1.5"])
      s.add_dependency(%q<bundler>, ["> 1.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<simplecov-rcov>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<mocha>, ["~> 0.9"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<mysql>, ["~> 2.8"])
      s.add_dependency(%q<mysql2>, ["~> 0.2"])
      s.add_dependency(%q<activerecord-mysql2spatial-adapter>, [">= 0"])
      s.add_dependency(%q<pg>, ["~> 0.10"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<geokit>, ["~> 1.5"])
    s.add_dependency(%q<bundler>, ["> 1.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<simplecov-rcov>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<mocha>, ["~> 0.9"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<mysql>, ["~> 2.8"])
    s.add_dependency(%q<mysql2>, ["~> 0.2"])
    s.add_dependency(%q<activerecord-mysql2spatial-adapter>, [">= 0"])
    s.add_dependency(%q<pg>, ["~> 0.10"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
