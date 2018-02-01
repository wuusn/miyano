require "thor"
require "webrick"

module Miyano
  module CLI
    class serve < Thor::Group
      include Thor::Actions

      def serve
        root = "site"
        server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root
        trap "INT" do server.shutdown end
        server.start
      end
    end
  end
end
