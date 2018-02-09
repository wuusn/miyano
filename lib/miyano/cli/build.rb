require "thor/group"
require "miyano/generator"
require "miyano/renderer"

module Miyano
  module CLI
    class Build < Thor::Group
      include Thor::Actions

      def build_posts
        files = Dir["post/*"]
        files.each do |file|
          Miyano::Renderer.Post(file)
        end

        Miyano.site.posts.each do |post|
          Miyano::Generator.Post post, "_site"
        end
      end

      def config_site
        site = Miyano.site
        # sort posts
        site.sort!
      end

      def build_templates
        #files = Dir["layout/*"]
        files =[]
        files << "layout/default.css.scss"
        files << "layout/index.html.erb"
        #files << "layout/about.html.erb"
        files.each do |file|
          template = Miyano::Renderer.Template file
          Miyano::Generator.Template template, "_site"
        end
      end

      Base.register(self, "build", "build", "build this site")
    end
  end
end
