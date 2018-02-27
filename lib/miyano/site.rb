module Miyano
  class Site

    def posts
      @posts ||= []
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
      @tags = @tags.sort_by {|_, value| -value}
                   .to_h
    end

    def tags
      @tags ||= {}
    end
  end
end
