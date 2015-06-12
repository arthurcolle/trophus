# -*- encoding: utf-8 -*-
# stub: image-picker-rails 0.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "image-picker-rails"
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Airat Shigapov"]
  s.date = "2014-07-27"
  s.description = "Image Picker is a simple jQuery plugin that transforms a select element into a more user friendly graphical interface."
  s.email = ["airat@shigapov.me"]
  s.homepage = "https://github.com/airatshigapov/image-picker-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Image Picker is a simple jQuery plugin that transforms a select element into a more user friendly graphical interface."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
