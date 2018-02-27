def build_default_css
  css = Dir["layout/default.css*"].first
  template = Tile.new css
  File.open("_site/default.css") do |f|
    f.write template.render
  end
end
