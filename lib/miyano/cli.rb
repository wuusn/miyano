require "thor"
require "miyano/cli/build"
require "miyano/cli/push"

module Miyano
  class CLI < Thor
    desc "version", "show version"
    def version
      puts "Miyano #{Miyano::VERSION}"
    end

    desc "new [DIR]", "create new blog"
    def new(dir)
      url = "https://github.com/wuusn/miyano_template.git"
      `git clone --depth 1 #{url} #{dir}`
    end

    desc "try", "try as a local web server"
    def try
      root = "_site"
      server = WEBrick::HTTPServer.new :Port => 8000,
                                       :DocumentRoot => root
      trap "INT" do server.shutdown end
      server.start
    end

    register(Build, "build", "build", "build posts and layouts")
    register(Push, "push", "push", "push to Github Pages")
  end
end
