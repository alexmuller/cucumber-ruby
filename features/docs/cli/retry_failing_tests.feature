Feature: Retry failing tests

  Retry gives you a way to get through flaky tests that usually pass after a few runs.
  This gives a development team a way forward other than disabling a valuable test.

  - Specify max retry count in option
  - Output information to the screen
  - Output retry information in test report

  Questions:
  use a tag for flaky tests?  Global option to retry any test that fails?

  Background:
    Given a scenario "Flakey" that fails once, then passes
    And a scenario "Shakey" that fails twice, then passes
    And a scenario "Solid" that passes
    And a scenario "No Dice" that fails

  @wip
  Scenario: Retry once, so Flakey starts to pass
    When I run `cucumber -q --retry 1`
    Then it should fail with:
      """
      7 scenarios (5 failed, 2 passed)
      """

  @wip
  Scenario: Retry twice, so Shakey starts to pass too

    First try:
    Flacey x
    Shakey x
    Solid ✔︎
    No Dice x
    => 4 scenarios (1 passed, 3 failed)

    First retry:
    Flakey ✔︎
    Shakey x
    No Dice x
    => 7 scenarios (2 passed, 5 failed)

    Second retry:
    Shakey ✔︎
    No Dice x
    => 9 scenarios (3 passed, 6 failed)

    When I run `cucumber -q --retry 2`
    Then it should fail with:
      """
      9 scenarios (6 failed, 3 passed)
      """
