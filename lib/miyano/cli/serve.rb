require "thor"
require "webrick"

module Miyano
  module CLI
    class Serve < Thor::Group
      include Thor::Actions

      def serve
        root = "site"
        server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root
        trap "INT" do server.shutdown end
        server.start
      end

      Base.register(self, "serve", "serve", "start a local web server")
    end
  end
end
