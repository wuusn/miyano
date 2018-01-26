Feature: Miyano Cli init

  Scenario: Show version
    When I run `miyano version`
    Then the output should contain "Miyano 0.1"

  Scenario: Create a new project
    When I run `miyano init PROJECT`
    Then the exit status should be 0
    #And the output should contain "asdf"
    When I cd to "PROJECT"
    Then the following files should exist:
      | Gemfile               |
      | .gitignore            |
      | config.rb             |
      | post/welcome.md       |
      | layout/index.html.erb |
      | layout/post.html.erb  |
      | layout/tag.html.erb   |
      | layout/site.css.scss  |

