Gem::Specification.new do |s|
  s.name = 'tilt-rails_erb'
  s.version = '1.0.0'
  s.platform = Gem::Platform::RUBY
  s.license = "MIT"
  s.summary = "Adds support for Rails' ERB templates to Tilt"
  s.author = "Jeremy Evans"
  s.email = "code@jeremyevans.net"
  s.homepage = "https://github.com/jeremyevans/tilt-rails_erb"
  s.files = %w(MIT-LICENSE CHANGELOG README.rdoc Rakefile) + Dir["{spec,lib}/**/*"] 
  s.description = <<END
tilt-rails_erb adds supports ERB templates using Rails' ERB handler,
which is different than standard ERB in that it supports using
<tt><%= foo do %><% end %></tt> syntax and it auto-escapes output.
END
  s.add_dependency('tilt')
  s.add_dependency('actionpack', '>= 3.2.0')
  s.add_development_dependency('minitest')
end
