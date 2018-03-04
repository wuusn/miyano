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
      @text[0..30]
    end

  end
end
