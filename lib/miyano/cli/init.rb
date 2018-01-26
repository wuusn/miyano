require "thor/group"

module Miyano
  module CLI
    class Init < Thor::Group
      include Thor::Actions
      argument :dirname, :type =>:string, :default => "."

      def clone_template
        url = "https://github.com/wuusn/miyano_template.git"
        run "git clone --depth 1 #{url} #{dirname}"
      end

      Base.register(self, "init", "init [dirname]",
                    "create new project at dirname")
      Base.map(
        "i" => "init",
        "new" => "init",
        "n" => "init"
      )
    end
  end
end
