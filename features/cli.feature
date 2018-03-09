Feature: Miyano Cli

  Scenario: Show version
    When I run `miyano version`
    Then the output should contain "Miyano 0.3.0"

  Scenario: New Project with markdown compatibility mode
    When I run `miyano new PROJECT -m`
    Then I cd to "PROJECT/post"
    And the file ".compat" should exist
