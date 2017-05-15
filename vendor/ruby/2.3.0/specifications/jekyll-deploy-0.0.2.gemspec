# -*- encoding: utf-8 -*-
# stub: jekyll-deploy 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-deploy"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vincent Wochnik"]
  s.date = "2015-11-24"
  s.description = "Jekyll 3.0-compatible deploy plugin"
  s.email = ["v.wochnik@gmail.com"]
  s.homepage = "https://github.com/vwochnik/jekyll-deploy"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.1"
  s.summary = "This plugin provides a simple jekyll command for deploying your static site."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<jekyll>, ["~> 3.0"])
    else
      s.add_dependency(%q<jekyll>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<jekyll>, ["~> 3.0"])
  end
end
