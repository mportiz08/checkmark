spec = Gem::Specification.new do |s|
  s.name         = 'checkmark'
  s.version      = '0.1.0'
  s.author       = 'Marcus Ortiz'
  s.email        = 'mportiz08@gmail.com'
  s.homepage     = 'http://github.com/mportiz08/checkmark'
  s.license      = 'MIT'
  s.summary      = 'checkmark lets you check your markdown files in a web browser'
  s.files        = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.dependencies = ['redcarpet']
  s.executables  = ['checkmark']
end
