@mothhgv @mothint
Feature: 41 - Check HGV with a just expired Annual Test

  Scenario: A MOTH user searches for a HGV with a Annual Test that is just about to expire
    Given I browse to /
    And I enter "EXYESTE" in the registration field
    When I press the "Continue" button

    Then The page contains "EXYESTE"
    And The page contains "CONVERSION"
    And The page contains "This vehicle's annual test has expired"
    And The page contains "You can be fined up to £1000 for driving without a valid MOT This vehicle may be MOT exempt, for more information refer to MOT exemption guidance"