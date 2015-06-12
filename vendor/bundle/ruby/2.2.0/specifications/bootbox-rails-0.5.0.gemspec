# -*- encoding: utf-8 -*-
# stub: bootbox-rails 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bootbox-rails"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andrew Kozloff"]
  s.date = "2015-05-12"
  s.description = "Wrappers for JavaScript alert(), confirm() and other flexible dialogs using Twitter's bootstrap framework for Rails 3.1+"
  s.email = ["demerest@gmail.com"]
  s.homepage = "https://github.com/tanraya/bootbox-rails"
  s.rubygems_version = "2.4.5"
  s.summary = "Wrappers for JavaScript alert(), confirm() and other flexible dialogs using Twitter's bootstrap framework for Rails 3.1+"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
      s.add_development_dependency(%q<gem-release>, [">= 0.4.1"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<gem-release>, [">= 0.4.1"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<gem-release>, [">= 0.4.1"])
  end
end
