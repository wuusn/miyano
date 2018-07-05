module Miyano
  class Post
    attr_reader :name, :title,
                :cre_date, :mod_date,
                :content, :text,
                :url

    def initialize(name, cre_date, mod_date, title="", content="",
                   text="", tags=[])
      @name, @title = name, title
      @cre_date, @mod_date = cre_date, mod_date
      @content, @text, @tags = content, text, tags
      @url = "/#{@name}/"
    end

    def date(format="%b %-d, %Y")
      @mod_date.strftime format
    end

    def tags
      @tags
    end

    def summary
      @text[(@title.length+2)..-1].delete "#*"
    end

    def content_no_assets
      res = @content.gsub /<p.*?\=\"assets\/.*?p>/, ""
      res[(@title.length+9)..-1]
    end

    def content_for_homepage
      res=@content.gsub /\=\"assets\//, %(="#{@url}assets/)
      res[(@title.length+9)..-1]
    end

  end
end
