require "zip"
require "beardown"
require "tilt"

module Miyano
  class Builder
    protected
    def build_bear
      files = Dir["post/*.bearnote"]
      files.each do |f|
        name = File.basename(f, ".*")
        bearnote = Zip::File.open f
        assets = bearnote.glob("#{name}.bearnote/assets/*")
        assets.each do |asset|
          dir = "_site/#{name}/assets"
          FileUtils.mkdir_p dir
          path = File.join dir, File.basename(asset.name)
          asset.extract path unless File.exist? path
        end

        text = bearnote.glob("#{name}.bearnote/text.txt")
                       .first.get_input_stream
                       .read

        FileUtils.mkdir_p "_site/#{name}"
        File.open("_site/#{name}/index.html", "w") do |html|
          html.write render_bear(f, text)
        end
      end
    end

    def render_bear(f, text)
      doc = Beardown.new text
      name = File.basename f, ".*"
      cre_date = File.birthtime f
      mod_date = File.mtime f

      post = Post.new name, cre_date, mod_date, doc.title,
                      doc.html, doc.content, doc.tags
      @site.add_post post

      template = Tilt.new "layout/post.html.erb"
      template.render post
    end
  end
end
