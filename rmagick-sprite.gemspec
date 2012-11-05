# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rmagick-sprite"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Scott Lewis"]
  s.date = "2012-11-05"
  s.description = "Encapsulates a \"Sprite\" in RMagick."
  s.email = "ryan@rynet.us"
  s.files = [".rvmrc", "Gemfile", "Gemfile.lock", "README.md", "Rakefile", "VERSION", "lib/sprite.rb", "lib/sprite/action.rb", "lib/sprite/frame.rb", "rmagick-sprite.gemspec"]
  s.homepage = "http://github.com/c00lryguy/rmagick-sprite"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Slice up spritesheets into Objects and export as images/animations or use with your favorite gaming library."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rmagick>, ["~> 2.13.1"])
      s.add_runtime_dependency(%q<version>, ["~> 1.0"])
      s.add_runtime_dependency(%q<dsl>, ["~> 0.2.2"])
    else
      s.add_dependency(%q<rmagick>, ["~> 2.13.1"])
      s.add_dependency(%q<version>, ["~> 1.0"])
      s.add_dependency(%q<dsl>, ["~> 0.2.2"])
    end
  else
    s.add_dependency(%q<rmagick>, ["~> 2.13.1"])
    s.add_dependency(%q<version>, ["~> 1.0"])
    s.add_dependency(%q<dsl>, ["~> 0.2.2"])
  end
end
