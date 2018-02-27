def build_tags
  @site.tags.each do |tag|
    FileUtils.mkdir_p "_site/#{tag}"
    site = Site.new
    @site.posts.each do |post|
      site.add_post post if post.tags.include? tag
    end
    template = Tilt.new "layout/index.html.erb"
    File.open("_site/#{tag}/index.html") do |html|
      html.write template.render site
    end
  end
end
