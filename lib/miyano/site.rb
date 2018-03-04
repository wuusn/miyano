module Miyano
  class Site

    def initialize
      @posts = []
      @tags = {}
    end

    def posts
      @posts
    end

    def add_post(post)
      @posts << post
      @posts.sort_by! {|p| [p.mod_date, p.cre_date]}
      @posts.reverse!

      post.tags.each do |tag|
        if @tags.include? tag
          @tags[tag] += 1
        else
          @tags[tag] = 1
        end
      end
      @tags = @tags.sort_by {|key, value| [-value, key.length]}
                   .to_h
    end

    def _tags
      @tags
    end

    def tags
      prefix = @current_tag
      ret_tags = []

      if prefix.nil?
        @tags.each do |_t, _|
          t = _t.split("/").first
          ret_tags << t unless ret_tags.include? t
        end
        return ret_tags
      end

      @tags.each do |_t, _|
        next if _t.length <= prefix.length
        if _t.start_with? prefix
          t = _t.delete_prefix prefix
          t = t.delete_prefix! "/"
          t = t.split("/").first if t
          ret_tags << t unless t.nil? or ret_tags.include? t
        end
      end
      return  ret_tags
    end

    def current_tag
      @current_tag
    end

    def current_tag=(tag)
      @current_tag = tag
    end
  end
end
