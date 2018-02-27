def build_html
  file = Dir["post/*.html"]
  files.each do |f|
    name = File.basename(f, ".*")
    FileUtils.mkdir_p "_site/#{name}"
    FileUtils.cp f, "_site/#{name}/index.html"
    render_html f
  end
end

def render_html(f)
  name = File.basename f, ".*"
  cre_date = File.birthtime f
  mod_date = File.mtime f

  post = Post.new name, cre_date, mod_date
  @site.add_post post
end
