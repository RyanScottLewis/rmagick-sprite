require 'rake/version_task'
require 'rubygems/package_task'

spec = Gem::Specification.new do |s|
  s.name = 'rmagick-sprite'
  s.author = 'Ryan Scott Lewis'
  s.email = 'ryan@rynet.us'
  
  s.homepage = "http://github.com/c00lryguy/#{s.name}"
  s.description = 'Encapsulates a "Sprite" in RMagick.'
  s.summary = 'Slice up spritesheets into Objects and export as images/animations or use with your favorite gaming library.'
  
  s.require_path = 'lib'
  s.files = `git ls-files`.lines.collect { |line| line.strip }
  s.executables = Dir['bin/*'].find_all { |file| File.executable?(file) }.collect { |file| File.basename(file) }
  
  s.add_dependency('rmagick', '~> 2.13.1')
  s.add_dependency('version', '~> 1.0')
  s.add_dependency('dsl', '~> 0.2.2')
end

Rake::VersionTask.new do |t|
  t.with_git_tag = true
  t.with_gemspec = spec
end


Gem::PackageTask.new(spec) do |t|
  t.need_zip = true
  t.need_tar = true
end
