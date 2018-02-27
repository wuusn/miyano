Feature: Miyano Cli

  Scenario: Show version
    When I run `miyano version`
    Then the output should contain "Miyano 0.2"

  Scenario: Create a new project
    When I run `miyano`
    Then the output should contain "hahah"
