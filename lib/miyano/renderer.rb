require "nokogiri"
require "miyano"
require "tilt"
module Miyano
  module Renderer
    class << self
      def Post(path)
        post = Miyano::Post.new path
        Miyano.site.posts << post
      end

      def Template(path)
        type = File.extname path
        name = File.basename path, ".*"
        case type
        when ".md", ".markdown"
        when ".erb"
          doc = Tilt.new path
          doc = doc.render(Miyano.site)
          Miyano::Template.new name,doc
        else
          doc = Tilt.new path
          doc = doc.render
          Miyano::Template.new name, doc
        end
      end
    end
  end
end
