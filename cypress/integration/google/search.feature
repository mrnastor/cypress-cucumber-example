Feature: Search Google
  @e2e-test
  Scenario: Common search
    Given I'm at Google
    When I type search word 'github'
    And Press 'Search'
    Then I have some results

  @e2e-test
  Scenario: Common search
    Given I'm at Google
    When I type search word 'Chuck Norris'
    And Press 'Search'
    Then I would have some results with 'Chuck Norris'