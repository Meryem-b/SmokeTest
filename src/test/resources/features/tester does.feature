# Theme 1 (Standard Regression), Test 7:
# Tester does:
#   MOT test
#   Retest
#   Abort
#   Add RFR Failures to a FAIL
#   Add PRS Failures to a PASS
#   Add advisory tests to both FAIL and PASS
#   Add, Edit, Remove a defect.
#
# When I do this, I usually log a vehicle and fail it. I then log it for retest and abort it. I then log it for retest
# again and fail it again. Finally I log the vehicle, ensuring that it can’t be logged as a retest and pass it. For
# each I will add  advisory items (usually 2 or 3) and ensure that I can edit and remove them before completing the
# test. I will also do a PRS on the passed test. The failure / PRS / advisory items are different each time, but not
# the end of the world if the same ones are used in each test.
#
# vary if tester aborts, fellow tester at same site aborts
Feature: Tester does...

  Scenario: Tester enters an MOT test pass
    Given I load "MOT_TESTER" as <username1>
    And I load "VEHICLE_CAR" as <registration1>, <vin1>, <mileage1>
    And I login with 2FA as <username1>

    When I start an MOT test for <registration1>, <vin1>
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And The page title contains "MOT test results"
    And I click the "Add reading" link

    And The page title contains "Odometer reading"
    And I enter <mileage1> plus 5000 in the odometer field
    And I press the "Update reading" button

    And The page title contains "MOT test results"
    And I click the "Add brake test" link

    #And The page title contains "Brake test configuration"
    And I select "Decelerometer" in the "Service brake test type" field
    And I select "Decelerometer" in the "Parking brake test type" field
    And I press the "Next" button

    And The page title contains "Add brake test results"
    And I enter "60" in the "Service brake" field
    And I enter "60" in the "Parking brake" field
    And I press the "Submit" button

    And The page title contains "Brake test summary"
    And I click the "Done" link

    Then The completed test status is "Pass"


  Scenario: Tester enters an MOT test fail (service brakes using decelerometer)
    Given I load "MOT_TESTER" as <username1>
    And I load "VEHICLE_CAR" as <registration1>, <vin1>, <mileage1>
    And I login with 2FA as <username1>

    When I start an MOT test for <registration1>, <vin1>
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And The page title contains "MOT test results"
    And I click the "Add reading" link

    And The page title contains "Odometer reading"
    And I enter <mileage1> plus 5000 in the odometer field
    And I press the "Update reading" button

    And The page title contains "MOT test results"
    And I click the "Add brake test" link

    #And The page title contains "Brake test configuration"
    And I select "Decelerometer" in the "Service brake test type" field
    And I select "Decelerometer" in the "Parking brake test type" field
    And I press the "Next" button

    And The page title contains "Add brake test results"
    And I enter "20" in the "Service brake" field
    And I enter "20" in the "Parking brake" field
    And I press the "Submit" button

    And The page title contains "Brake test summary"
    And I click the "Done" link

    Then The completed test status is "Fail"

  Scenario: Tester enters an MOT test fail (with defect - steering - failure)
    Given I load "MOT_TESTER" as <username1>
    And I load "VEHICLE_CAR" as <registration1>, <vin1>, <mileage1>
    And I login with 2FA as <username1>

    When I start an MOT test for <registration1>, <vin1>
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And The page title contains "MOT test results"
    And I click the "Add reading" link

    And The page title contains "Odometer reading"
    And I enter <mileage1> plus 5000 in the odometer field
    And I press the "Update reading" button

    And I add a "Failure" defect of ("Steering", "Steering operation", "Steering system excessively tight") with comment "Test defect 1"

    And The page title contains "MOT test results"
    And I click the "Add brake test" link

    #And The page title contains "Brake test configuration"
    And I select "Decelerometer" in the "Service brake test type" field
    And I select "Decelerometer" in the "Parking brake test type" field
    And I press the "Next" button

    And The page title contains "Add brake test results"
    And I enter "60" in the "Service brake" field
    And I enter "60" in the "Parking brake" field
    And I press the "Submit" button

    And The page title contains "Brake test summary"
    And I click the "Done" link

    Then The completed test status is "Fail"

  Scenario: Tester aborts an MOT test
    Given I load "MOT_TESTER" as <username1>
    And I load "VEHICLE_CAR" as <registration1>, <vin1>, <mileage1>
    And I login with 2FA as <username1>

    When I start an MOT test for <registration1>, <vin1>
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And The page title contains "MOT test results"
    And I click the "Cancel test" link

    And The page title contains "Cancel MOT test"
    And I click the "Aborted by VE" radio button
    And I press the "Confirm and cancel test" button

    Then The page title contains "MOT test aborted"
