module Miyano
  require "miyano/build/bear"
  require "miyano/build/html"
  require "miyano/build/default_css"
  require "miyano/build/index"
  require "miyano/build/tags"

  def build_the_world
    # post
    ["bear","html"].each do |attr|
      send "build_#{attr}"
    end

    # layout
    ["default_css", "index", "tags"].each do |attr|
      send "build_#{attr}"
    end
  end
end
