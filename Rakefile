require "rake"
require "rake/clean"

CLEAN.include ["tilt-rails_erb-*.gem", "rdoc", "coverage"]

desc "Build tilt-rails_erb gem"
task :package=>[:clean] do |p|
  sh %{#{FileUtils::RUBY} -S gem build tilt-rails_erb.gemspec}
end

### Specs

desc "Run tests"
task :test do
  sh "#{FileUtils::RUBY} spec/tilt_rails_erb_spec.rb"
end

task :default => :test

### RDoc

RDOC_DEFAULT_OPTS = ["--quiet", "--line-numbers", "--inline-source", '--title', 'tilt-rails_erb: Tilt support for Rails ERB templates']

begin
  gem 'hanna-nouveau'
  RDOC_DEFAULT_OPTS.concat(['-f', 'hanna'])
rescue Gem::LoadError
end

rdoc_task_class = begin
  require "rdoc/task"
  RDoc::Task
rescue LoadError
  require "rake/rdoctask"
  Rake::RDocTask
end

RDOC_OPTS = RDOC_DEFAULT_OPTS + ['--main', 'README.rdoc']

rdoc_task_class.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.options += RDOC_OPTS
  rdoc.rdoc_files.add %w"README.rdoc CHANGELOG MIT-LICENSE lib/**/*.rb"
end

