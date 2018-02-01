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
