require "zip"
require "beardown"
require "tilt"

module Miyano
  class Builder
    protected
    def build_bear
      require "beardown/compat" if File.exist? "post/.compat"
      files = Dir["post/*.bearnote"]
      files.each do |f|
        name = File.basename(f, ".*")
        bearnote = Zip::File.open f

        # the name of the zip file maybe different from the name of zip dir
        # i.e. first zip as `foo.zip`, the zip dir is `foo`, then rename to `bar.zip`, the zip dir still remains `foo`
        #zipdir = File.dirname bearnote.entries[0].name
        #zipdir = zipdir.force_encoding "UTF-8"
        zipdir = getZipDir bearnote.entries[0].name
        assets = bearnote.glob("#{zipdir}/assets/*")
        dir = "_site/#{name}/assets"
        assets.each do |asset|
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
        auto_orient_imgs(dir) if Dir.exist? dir
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

    def getZipDir(str)
      while(str.include? "/")
        str = File.dirname str
      end
      return str
    end

    def auto_orient_imgs(dir)
      return unless check_imagemagick
      imgs = Dir["#{dir}/*.{jpg,jpeg,JPG,JPEG}"]
      imgs.each do |img|
        `convert -auto-orient #{img.inspect} #{img.inspect}`
      end
    end

    def check_imagemagick
      system "convert -version >/dev/null"
      system "brew install imagemagick graphicsmagick" unless $?.success?
      unless $?.success?
        system "/usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'"
        system "brew install imagemagick graphicsmagick" if $?.success?
      end
      system "convert -version >/dev/null"
    end

  end
end
