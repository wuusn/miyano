require "thor/group"

module Miyano
  module CLI
    class Clean < Thor::Group
      include Thor::Actions

      def delete
        FileUtils.rm_rf "_site"
      end

      Base.register(self, "clean", "clean", "clean site files")
    end
  end
end
