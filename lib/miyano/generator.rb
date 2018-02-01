module Miyano
  module Generator
    class << self
      def Post(post, dir)
        unless Dir.exist? dir
          Dir.mkdir dir
        end
        dir << "/#{post.name}"
        unless Dir.exist? dir
          Dir.mkdir dir
        end
        File.open("#{dir}/index.html", "w") do |f|
          f.write post.html
        end
      end

      def Template(template, dir)
        File.open("#{dir}/#{template.name}", "w") do |f|
          f.write template.doc
        end
      end
    end
  end
end
