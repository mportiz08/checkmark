require 'redcarpet'
require 'fileutils'

module Checkmark
  VERSION = '0.1.1'
  
HTML_BEGIN = <<HTML
<!DOCTYPE html>
<html>
<head>
  <title>checkmark</title>
</head>
<style>
  body{font-family:helvetica, arial;font-size:13px;background:#e7e7e7;}
  h1,h2,h3,h4,h5,h6{border:0;}
  h1{font-size:170%;border-top:4px solid #aaa;padding-top:.5em;margin-top:1.5em;}
  h1:first-child{margin-top:0;padding-top:.25em;border-top:none;}
  h2{font-size:150%;margin-top:1.5em;border-top:4px solid #e0e0e0;padding-top:.5em;}
  h3{margin-top:1em;}
  p{margin:1em 0;line-height:1.5em;}
  ul{margin:1em 0 1em 2em;padding:0;}
  ol{margin:1em 0 1em 2em;padding:0;}
  ol li,ul li{margin-top:.5em;margin-bottom:.5em;}
  ul ul,ul ol,ol ol,ol ul,{margin-top:0;margin-bottom:0;}
  blockquote{margin:1em 0;border-left:5px solid #ddd;padding-left:.6em;color:#555;}
  dt{font-weight:bold;margin-left:1em;}
  dd{margin-left:2em;margin-bottom:1em;}
  table{margin:1em 0;}
  table th{border-bottom:1px solid #bbb;padding:.2em 1em;}
  table td{border-bottom:1px solid #ddd;padding:.2em 1em;}
  pre{margin:1em 0;font-size:12px;background-color:#f8f8ff;border:1px solid #dedede;padding:.5em;line-height:1.5em;color:#444;overflow:auto;}
  pre code{padding:0;font-size:12px;background-color:#f8f8ff;border:none;}
  code{font-size:12px;background-color:#f8f8ff;color:#444;padding:0 .2em;border:1px solid #dedede;}
  a{color:#4183c4;text-decoration:none;}
  a:hover{text-decoration:underline;}
  a code,a:link code,a:visited code{color:#4183c4;}
  img{max-width:100%;}
  .info{background:#999;color:#fff;font-size:12px;padding:5px;}
  #header{width:920px;margin:0 auto 15px auto;}
  #header blockquote{color:#fff;}
  #frame{background:#fff;border:1px solid #e7e7e7;width:920px;margin:0 auto;padding:5px;}
  #frame .info{font-weight:bold;}
  #footer{font-weight:bold;width:920px;margin:0 auto;padding:15px 0;text-align:right;}
  #footer a,#footer a:visited,#footer a:hover,#footer a:active{color:#333}
</style>
<body>
<div id="header" class="info">
  <h1>checkmark</h1>
  <blockquote>"<strong><em>check</em></strong> your <strong><em>mark</em></strong>down"</blockquote>
</div>
<div id="frame">
HTML

HTML_END = <<HTML
</div>
<div id="footer"><span class="info">&#8730; checkmark &copy; 2011 <a href="http://marcusortiz.com">marcus ortiz</a></span></div>
</body>
</html>
HTML
  
  def self.dir
    File.join("#{ENV['HOME']}", ".check")
  end
  
  def self.preview_file
    File.join(self.dir, 'mark.html')
  end
  
  def self.run(filename)
    FileUtils.mkdir_p(self.dir) unless File.exists?(self.dir)
    File.open(self.preview_file, 'w') do |f|
      f.write HTML_BEGIN
      f.write "<span class=\"info\">#{filename}</span>"
      f.write Redcarpet.new(File.read(filename)).to_html
      f.write HTML_END
    end
    `open #{self.preview_file}` if RUBY_PLATFORM =~ /darwin/
  end
  
  def self.usage
    "Usage: checkmark <file>"
  end
  
  def self.version
    "checkmark v#{VERSION}\nmarcus ortiz"
  end
  
  def self.help
help = <<HELP
Examples:
  checkmark README.md
  checkmark path/to/file.markdown

Notes:
If you're using OS X, checkmark will open the rendered html for your markdown file in a web browser. Otherwise, you can manually open the `mark.html` file that is created  your `$HOME/.check/` directory.
HELP
  "#{self.usage}\n\n#{help}"
  end
end
