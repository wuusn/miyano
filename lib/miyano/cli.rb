# Setup our load paths
libdir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
require "thor"

module Miyano
  module CLI
    class Base < Thor
      desc "version", "show version"
      def version
        puts "Miyano #{Miyano::VERSION}"
      end
    end
  end
end
