require "nokogiri"
require "miyano"
require "tilt"
module Miyano
  module Renderer
    class << self
      def Post(path)
        # file info
        cre_date = File.birthtime(path)
        mod_date = File.ctime(path)
        name = File.basename(path, ".*").gsub(/\s+/, '_')
        type = File.extname(path)

        if type == ".html"
          doc = Nokogiri::HTML(File.open(path))
          h1 = doc.css("title").first.content
          # change file path
          # TODO
        elsif type == (".md" || ".markdown")
          # TODO
        end

        post = Miyano::Post.new(name, h1, cre_date, mod_date, doc)
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
