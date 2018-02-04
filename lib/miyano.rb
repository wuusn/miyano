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

#    def add_post(post)
#      @posts << post
#    end
  end

  class Post
    attr_reader :title, :cre_date, :mod_date, :url, :html, :name
    def initialize(name, title, cre_date, mod_date, html)
      @name, @title, @cre_date, @mod_date, @html = name, title, cre_date, mod_date, html
      #@path = "site/#{name}index.html"
      @url = @name
    end
  end

  class Template
    attr_reader :name, :doc
    def initialize(name, doc)
      @name, @doc = name, doc
    end
  end

end
