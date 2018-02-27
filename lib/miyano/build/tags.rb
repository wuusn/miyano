module Miyano
  class Builder
    protected
    def build_tags
      @site.tags.each do |tag, _|
        FileUtils.mkdir_p "_site/#{tag}"
        site = Site.new
        @site.posts.each do |post|
          site.add_post post if post._tags.include? tag
        end
        template = Tilt.new "layout/tags.html.erb"
        File.open("_site/#{tag}/index.html", "w") do |html|
          html.write template.render site
        end
      end
    end
  end
end
