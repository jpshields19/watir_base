Feature: Google Search
  @google
  Scenario: Search google for cats
    Given I open google
    When I search for cats
    # Then I should see cats
