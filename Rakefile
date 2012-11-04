require 'rake/version_task'

spec = Gem::Specification.new do |s|
  s.name = ''
  s.author = 'Ryan Scott Lewis'
  s.homepage = 'http://github.com/c00lryguy/rspec-web'
  s.description = 'A web front-end for RSpec tests.'
  s.summary = 'Run and view Rspec tests from the browser.'
  s.email = 'ryan@rynet.us'
  
  s.require_path = 'lib'
  s.files = `git ls-files`.lines.collect { |line| line.strip }
  s.executables = Dir['bin/*'].find_all { |file| File.executable?(file) }.collect { |file| File.basename(file) }
  
  s.add_dependency('rmagick', '~> 2.13.1')
  s.add_dependency('version', '~> 1.0')
end

Rake::VersionTask.new do |task|
  task.with_git_tag = true
  task.with_gemspec = spec
end