require 'thor/group'

module Miyano
  module CLI
    class Depoly < Thor::Group

      #def first
        #@dir = '_site'
        #puts "not depoly"
      #end

      ##def check_build
      ##  unless Dir.exist? @dir
      ##    `miyano build`
      ##  end
      ##end

      #def deploy
        #puts "deploy"
      #end

      #def first_git
        #unless Dir.exist? "#{@dir}/.git"
          #Dir.mkdir @dir
          #FileUtils.cd @dir do
            #puts "Enter the url for your repository"
            #puts "(eg: https://github.com/username/username.github.io)"
            ##repo = get_stdin "repo url:"
            #print "repo url:"
            #repo = STDIN.gets.chomp
            #`git init`
            #`git remote add origin #{repo}`
            #`git pull origin master` #
            ## clean this repo
            ##`miyano build`
            ##`git add .`
            ##`git commit -m "miyano init"`
          #end
        #end
      #end

      #def git_update
        #FileUtils.cd @dir do
          #`git add .`
          #`git commit -m "site updated at #{Time.now}"`
          #`git push -u origin master`
        #end
      #end

      def depoly
        @dir = "_site"
        unless Dir.exist? "#{@dir}/.git"
          first_git
        end
        update
      end

      protected

      def first_git
        unless Dir.exist? @dir
          FileUtils.rm_rf @dir
          Dir.mkdir @dir
        end

        FileUtils.cd @dir do
          puts "Enter the url for your repository"
          puts "(eg: https://github.com/username/username.github.io)"
          #repo = get_stdin "repo url:"
          print "repo url:";repo = STDIN.gets.chomp

          `git init`
          `git remote add origin #{repo}`
          `git pull origin master`
          `rm -rf *`
        end
      end

      def update
        `miyano build`
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
