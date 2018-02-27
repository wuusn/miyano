module Miyano
  class Builder
    protected
    def build_default_css
      css = Dir["layout/default.css*"].first
      template = Tilt.new css
      File.open("_site/default.css", "w") do |f|
        f.write template.render
      end
    end
  end
end
