# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = ""
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Scott Lewis"]
  s.date = "2012-11-04"
  s.description = "Encapsulates a \"Sprite\" in RMagick."
  s.email = "ryan@rynet.us"
  s.files = [".rvmrc", "Gemfile", "Rakefile"]
  s.homepage = "http://github.com/c00lryguy/"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Slice up spritesheets into Objects and export as images/animations or use with your favorite gaming library."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rmagick>, ["~> 2.13.1"])
      s.add_runtime_dependency(%q<version>, ["~> 1.0"])
    else
      s.add_dependency(%q<rmagick>, ["~> 2.13.1"])
      s.add_dependency(%q<version>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<rmagick>, ["~> 2.13.1"])
    s.add_dependency(%q<version>, ["~> 1.0"])
  end
end
