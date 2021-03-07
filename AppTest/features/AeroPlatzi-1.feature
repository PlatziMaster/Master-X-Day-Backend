Feature: Verify that the AeroPlatzi works correctly
    The user should be able to use AeroPlatzi

    Scenario: Users goes to the AeroPlatzi HomePage
        Given user opens the AeroPlatzi homepage
        When user lands at the homepage
        Then user verifies the page is correct

    Scenario: User is able to see a Flight
        Given user open the AeroPlatzi homepage
        When user lands at the homepage
        Then user see all the flights

    Scenario Outline: User should be able to add Flights
        Given user open the AeroPlatzi homepage
        When user lands at the homepage
        Then user adds "<RouteId>"
        Then user adds "<PlaneId>"
        Then user adds "<StatusId>"
        Then user adds "<NumPassanger>"

        Examples:
            | RouteId | PlaneId | StatusId | NumPassanger |
            | 1       | 2       | 3        | 4            |
            | 5       | 5       | 5        | 4            |
            | 6       | 7       | 3        | 3            |
            | 7       | 10      | 2        | 2            |
            | 8       | 9       | 1        | 3            |

