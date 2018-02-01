Feature: Miyano Cli

  Scenario: Show version
    When I run `miyano version`
    Then the output should contain "Miyano 0.1"

  Scenario: Create and Build a new project
    When I run `miyano init PROJECT`
    Then the exit status should be 0
    #And the output should contain "asdf"
    When I cd to "PROJECT"
    Then the following files should exist:
      | Gemfile               |
      | .gitignore            |
      | config.rb             |
      | post/welcome.html     |
      | layout/index.html.erb |
      | layout/default.css.scss  |
    And I run `miyano build`
    Then the following files should exist:
      | site/default.css           |
      | site/index.html            |
      | site/Miyano_0.1/index.html |
      | site/welcome/index.html    |
