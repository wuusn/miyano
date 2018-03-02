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

        # the name of the zip file maybe different from the name of zip dir
        # i.e. first zip as `foo.zip`, the zip dir is `foo`, then rename to `bar.zip`, the zip dir still remains `foo`
        zipdir = File.dirname bearnote.entries[0].name
        #zipdir = zipdir.force_encoding "UTF-8"
        assets = bearnote.glob("#{zipdir}/assets/*")
        assets.each do |asset|
          dir = "_site/#{name}/assets"
          FileUtils.mkdir_p dir
          path = File.join dir, File.basename(asset.name)
          asset.extract path unless File.exist? path
        end

        text = bearnote.glob("#{zipdir}/text.txt")
                       .first.get_input_stream
                       .read.force_encoding("UTF-8")

        FileUtils.mkdir_p "_site/#{name}"
        File.open("_site/#{name}/index.html", "w") do |html|
          html.write render_bear(f, text)
        end
      end
    end

    def render_bear(f, text)
      doc = Beardown.new text
      name = File.basename f, ".*"
      name = name
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
