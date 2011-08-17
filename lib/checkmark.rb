require 'redcarpet'
require 'fileutils'

module Checkmark
HTML_BEGIN = <<HTML
<!DOCTYPE html>
<html>
<head>
  <title>Checkmark -- preview your markdown</title>
</head>
<style>
  {color:#000;}
  {background-color:#f8f8f8;font-family:Helvetica;}
  h1,h2,h3,h4,h5,h6{border:0;}
  h1{font-size:170%;border-top:4px solid #aaa;padding-top:.5em;margin-top:1.5em;}
  h1:first-child{margin-top:0;padding-top:.25em;border-top:none;}
  h2{font-size:150%;margin-top:1.5em;border-top:4px solid #e0e0e0;padding-top:.5em;}
  h3{margin-top:1em;}
  p{margin:1em 0;line-height:1.5em;}
  ul{margin:1em 0 1em 2em;}
  ol{margin:1em 0 1em 2em;}
  ul li{margin-top:.5em;margin-bottom:.5em;}
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
  #frame{border:1px solid #e7e7e7;width:920px;margin:0 auto;padding:5px;}
</style>
<body>
<div id="frame">
HTML

HTML_END = <<HTML
</div>
</body>
</html>
HTML
  
  def self.dir
    File.join("#{ENV['HOME']}", ".checkmark")
  end
  
  def self.preview_file
    File.join(self.dir, 'preview.html')
  end
  
  def self.run(filename)
    FileUtils.mkdir_p(self.dir) unless File.exists?(self.dir)
    File.open(self.preview_file, 'w') do |f|
      f.write HTML_BEGIN
      f.write "<h1 class=\"headline\">#{File.basename(filename)}</h1>"
      f.write Redcarpet.new(File.read(filename)).to_html
      f.write HTML_END
    end
    `open #{self.preview_file}` if RUBY_PLATFORM =~ /darwin/
  end
end
