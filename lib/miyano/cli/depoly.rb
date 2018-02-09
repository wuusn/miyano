require 'thor/group'

module Miyano
  module CLI
    class Depoly < Thor::Group
      include Thor::Actions

      @dir = '_site'

      def always_build_and_clean
      end

      def check_build
        unless Dir.exist? @dir
          `miyano build`
        end
      end

      def first_git
        FileUtils.cd @dir do
          unless Dir.exist? '.git'
            puts "Enter the url for your repository"
            puts "(eg: https://github.com/username/username.github.io)"
            repo = get_stdin "repo url:"
            `git init`
            `git remote add origin #{repo}`
            `git add .`
            `git commit -m "miyano init"`
          end
        end
      end

      def git_update
        FileUtils.cd @dir do
          `git add .`
          `git commit -m "site updated at #{Time.now}"`
          `git push -u origin master`
        end
      end

      Base.register(self, 'depoly', 'depoly', 'depoly to Github Pages')
    end
  end
end
