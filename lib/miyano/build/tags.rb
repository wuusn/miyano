module Miyano
  class Builder
    protected
    def build_tags
      @site.tags.each do |tag, _|
        site = Site.new
        site.current_tag = tag
        @site.posts.each do |post|
          site.add_post post if post._tags.include? tag
        end
        template = Tilt.new "layout/index.html.erb"
        FileUtils.mkdir_p "_site/tag/#{tag}"
        File.open("_site/tag/#{tag}/index.html", "w") do |html|
          html.write template.render site
        end
      end
    end
  end
end
