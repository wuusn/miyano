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
          Miyano::Generator.Post post, "site"
        end
      end

      def build_templates
        files = Dir["layout/*"]
        files.each do |file|
          template = Miyano::Renderer.Template file
          Miyano::Generator.Template template, "site"
        end
      end

      Base.register(self, "build", "build", "build this site")
    end
  end
end
