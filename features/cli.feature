Feature: Miyano Cli

  Scenario: Show version
    When I run `miyano version`
    Then the output should contain "Miyano 0.1"

  Scenario: Create a new project
    When I run `miyano init PROJECT`
    Then the exit status should be 0
    #And the output should contain "asdf"
    When I cd to "PROJECT"
    Then the following files should exist:
      | Gemfile                  |
      | .gitignore               |
      | config.rb                |
      | post/welcome.html        |
      | layout/index.html.erb    |
      | layout/default.css.scss  |

      #Scenario: Build this project
      #    When I cd to "PROJECT"
    And I run `miyano build`
    Then the following files should exist:
      | _site/default.css           |
      | _site/index.html            |
      | _site/Miyano_0.1/index.html |
      | _site/welcome/index.html    |

  #Scenario: Clean the build site files
    #When I cd to "PROJECT"
    And I run `miyano clean`
    Then the directory "_site" should not exist
