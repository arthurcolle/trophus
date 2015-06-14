# -*- encoding: utf-8 -*-
# stub: s3_direct_upload 0.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "s3_direct_upload"
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Wayne Hoover"]
  s.date = "2014-03-13"
  s.description = "Direct Upload to Amazon S3 With CORS and jquery-file-upload"
  s.email = ["w@waynehoover.com"]
  s.homepage = ""
  s.rubygems_version = "2.4.5"
  s.summary = "Gives a form helper for Rails which allows direct uploads to s3. Based on RailsCast#383"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
      s.add_runtime_dependency(%q<coffee-rails>, [">= 3.1"])
      s.add_runtime_dependency(%q<sass-rails>, [">= 3.1"])
      s.add_runtime_dependency(%q<jquery-fileupload-rails>, ["~> 0.4.1"])
    else
      s.add_dependency(%q<rails>, [">= 3.1"])
      s.add_dependency(%q<coffee-rails>, [">= 3.1"])
      s.add_dependency(%q<sass-rails>, [">= 3.1"])
      s.add_dependency(%q<jquery-fileupload-rails>, ["~> 0.4.1"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1"])
    s.add_dependency(%q<coffee-rails>, [">= 3.1"])
    s.add_dependency(%q<sass-rails>, [">= 3.1"])
    s.add_dependency(%q<jquery-fileupload-rails>, ["~> 0.4.1"])
  end
end
