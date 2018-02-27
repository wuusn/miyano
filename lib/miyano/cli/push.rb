module Miyano
  class Push < Thor::Group
    @dir = "_site".freeze

    def check_if_first
      unless Dir.exits? File.join @dir, ".git"
        FileUtils.mkdir_p @dir
        FileUtils.cd @dir do
          p "Enter the url of your Github Pages repo"
          p "(eg: https://github.com/username/username.github.io)"
          p "WARN: It will delete all files already in the repo"
          print "repo url:";repo = STDIN.gets.chomp
          `git init`
          `git remote add origin #{repo}`
          `git pull origin master`
          `rm -rf *`
        end
      end
    end

    def build_everytime
      CLI.new.build
    end

    def push
      FileUtils.cd @dir do
        `git add .`
        `git commit -m "site updated at #{Time.now}"`
        `git push -u origin master`
      end
    end
  end
end
