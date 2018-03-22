#@mothpp @mothint
@mothhgv
Feature: 42 - Check HGV with a Annual Test that expires today

  Scenario: A MOTH user searches for a HGV with a Annual Test that expires today
    Given I browse to /
    And I enter "EXTODAY" in the registration field
    When I press the "Continue" button

    Then The page contains "EXTODAY"
    And The page contains "DAF FA LF45.130 08"
    And The page contains "This vehicle's MOT expires soon"