spec = Gem::Specification.new do |s|
  s.name           = 'checkmark'
  s.version        = '0.1.0'
  s.author         = 'Marcus Ortiz'
  s.email          = 'mportiz08@gmail.com'
  s.homepage       = 'http://github.com/mportiz08/checkmark'
  s.license        = 'MIT'
  s.summary        = 'checkmark lets you check your markdown files in a web browser'
  s.description    = "If you're using OS X, checkmark will open the rendered html for your markdown file in a web browser. Otherwise, you can manually open the `mark.html` file that is created  your `$HOME/.check/` directory."
  s.files          = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.add_dependency 'redcarpet'
  s.executables    = ['checkmark']
end
