def build_index
  template = Tilt.new "layout/index.html.erb"
  File.open("_site/index.html", "w") do |html|
    html.write template.render @site
  end
end
