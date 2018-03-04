module Miyano
  class Build < Thor::Group
    def check_root
      unless Dir.exist?("post") and Dir.exist?("layout")
        fail "!!wrong dirctory"
      end
    end

    def clean
      if Dir.exist?("_site")
        FileUtils.cd "_site" do
          files = Dir["*"]
          files.delete "CNAME"
          files.each do |f|
            FileUtils.rm_rf f
          end
        end
      end
    end

    def build
      Builder.new.build_the_world
    end
  end
end
