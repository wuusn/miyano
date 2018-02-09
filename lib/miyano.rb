require "miyano/version"
require "miyano/cli"
require "miyano/renderer"
require "miyano/generator"

module Miyano
  @@site
  class << self
    def site
      @site ||= Site.new
    end
  end
  class Site
    attr_reader :posts

    def initialize
      @posts = []
    end

    def sort!
      @posts.sort_by! {|a| [a.mod_date, a.cre_date] }
      @posts.reverse!
    end

#    def add_post(post)
#      @posts << post
#    end
  end

  class Post
    attr_reader :title, :cre_date, :mod_date, :url, :html, :name, :summary
    def initialize(path)
      cre_date = File.birthtime(path)
      mod_date = File.mtime(path)
      name = File.basename(path, ".*").gsub(/\s+/, '_')
      type = File.extname(path)

      if type == ".html"
        doc = Nokogiri::HTML(File.open(path))
        title = doc.css("title").first.content
        @summary = ""
        # change file path
        # TODO
      elsif type == (".md" || ".markdown")
        # TODO
      end

      @name, @title, @cre_date, @mod_date, @html = name, title, cre_date, mod_date, doc
      @url = @name
    end
    def time
      if Date.today.year == @mod_date.year
        @mod_date.strftime "%b %-d"
      elsif Date.today.year > @mod_date.year
        @mod_date.strftime "%b %-d,%Y"
      else
        "Future!"
      end
    end
  end

  class Template
    attr_reader :name, :doc
    def initialize(name, doc)
      @name, @doc = name, doc
    end
  end

end
