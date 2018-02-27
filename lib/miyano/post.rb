module Miyano
  class Post
    attr_reader :name, :title,
                :cre_date, :mod_date,
                :summary, :content, :tags

    def initialize(name, cre_date, mod_date, title="", html="",
                   content="", tags=[])
      @name, @title = name, title
      @cre_date, @mod_date = cre_date, mod_date
      @html, @content, @tags = html, content, tags
    end

    def date(format="%b %-d, %Y")
      @mod_date.strftime format
    end

  end
end
