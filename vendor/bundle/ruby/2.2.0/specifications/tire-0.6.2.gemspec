# -*- encoding: utf-8 -*-
# stub: tire 0.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "tire"
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Karel Minarik"]
  s.date = "2014-01-15"
  s.description = "   Tire is a Ruby client for the Elasticsearch search engine/database.\n\n   It provides Ruby-like API for fluent communication with the Elasticsearch server\n   and blends with ActiveModel class for convenient usage in Rails applications.\n\n   It allows to delete and create indices, define mapping for them, supports\n   the bulk API, and presents an easy-to-use DSL for constructing your queries.\n\n   It has full ActiveRecord/ActiveModel compatibility, allowing you to index\n   your models (incrementally upon saving, or in bulk), searching and\n   paginating the results.\n\n   Please check the documentation at <http://karmi.github.com/retire/>.\n"
  s.email = "karmi@karmi.cz"
  s.extra_rdoc_files = ["README.markdown", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README.markdown"]
  s.homepage = "http://github.com/karmi/tire"
  s.post_install_message = "================================================================================\n\n  Please check the documentation at <http://karmi.github.com/retire/>.\n\n--------------------------------------------------------------------------------\n\n  IMPORTANT CHANGES LATELY:\n\n  19e524c [ACTIVEMODEL] Exposed the response from `MyModel#.update_index` as the `response` method on return value\n  bfcde21 [#916] Added support for the Suggest API (@marc-villanueva)\n  710451d [#857] Added support for the Suggest API (@fbatista)\n\n  See the full changelog at <http://github.com/karmi/tire/commits/v0.6.2>.\n\n--------------------------------------------------------------------------------\n"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "tire"
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby client for Elasticsearch"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.6"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_runtime_dependency(%q<activemodel>, [">= 3.0"])
      s.add_runtime_dependency(%q<hashr>, ["~> 0.0.19"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<ansi>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<shoulda-context>, [">= 0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.13"])
      s.add_development_dependency(%q<minitest>, ["~> 2.12"])
      s.add_development_dependency(%q<activerecord>, [">= 3.0"])
      s.add_development_dependency(%q<active_model_serializers>, [">= 0"])
      s.add_development_dependency(%q<mongoid>, ["~> 2.2"])
      s.add_development_dependency(%q<redis-persistence>, [">= 0"])
      s.add_development_dependency(%q<faraday>, [">= 0"])
      s.add_development_dependency(%q<yajl-ruby>, ["~> 1.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<bson_ext>, [">= 0"])
      s.add_development_dependency(%q<curb>, [">= 0"])
      s.add_development_dependency(%q<oj>, [">= 0"])
      s.add_development_dependency(%q<turn>, ["~> 0.9"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rest-client>, ["~> 1.6"])
      s.add_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_dependency(%q<activemodel>, [">= 3.0"])
      s.add_dependency(%q<hashr>, ["~> 0.0.19"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<ansi>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<shoulda-context>, [">= 0"])
      s.add_dependency(%q<mocha>, ["~> 0.13"])
      s.add_dependency(%q<minitest>, ["~> 2.12"])
      s.add_dependency(%q<activerecord>, [">= 3.0"])
      s.add_dependency(%q<active_model_serializers>, [">= 0"])
      s.add_dependency(%q<mongoid>, ["~> 2.2"])
      s.add_dependency(%q<redis-persistence>, [">= 0"])
      s.add_dependency(%q<faraday>, [">= 0"])
      s.add_dependency(%q<yajl-ruby>, ["~> 1.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<bson_ext>, [">= 0"])
      s.add_dependency(%q<curb>, [">= 0"])
      s.add_dependency(%q<oj>, [">= 0"])
      s.add_dependency(%q<turn>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rest-client>, ["~> 1.6"])
    s.add_dependency(%q<multi_json>, ["~> 1.3"])
    s.add_dependency(%q<activemodel>, [">= 3.0"])
    s.add_dependency(%q<hashr>, ["~> 0.0.19"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<ansi>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<shoulda-context>, [">= 0"])
    s.add_dependency(%q<mocha>, ["~> 0.13"])
    s.add_dependency(%q<minitest>, ["~> 2.12"])
    s.add_dependency(%q<activerecord>, [">= 3.0"])
    s.add_dependency(%q<active_model_serializers>, [">= 0"])
    s.add_dependency(%q<mongoid>, ["~> 2.2"])
    s.add_dependency(%q<redis-persistence>, [">= 0"])
    s.add_dependency(%q<faraday>, [">= 0"])
    s.add_dependency(%q<yajl-ruby>, ["~> 1.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<bson_ext>, [">= 0"])
    s.add_dependency(%q<curb>, [">= 0"])
    s.add_dependency(%q<oj>, [">= 0"])
    s.add_dependency(%q<turn>, ["~> 0.9"])
  end
end
