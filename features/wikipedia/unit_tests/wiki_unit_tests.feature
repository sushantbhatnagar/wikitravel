Feature: Wikipedia Search Results - Unit Tests

  As a user
  I want to navigate to Wikipedia website
  So I can search results on Wikipedia

  @wikipedia_title @unit_test @rspec_test
  Scenario: Verify the title of Wikipedia landing page is displayed as 'WIKIPEDIA'
    Given I am on the Wikipedia Landing page (ph)
    Then I should see the title on the landing page as WIKIPEDIA (ph)

  @search_results_error_message @unit_test @rspec_test
  Scenario: Verify I should see an error message when the search server is not available
    Given I am on the Wikipedia Landing page (ph)
    When I search for furry rabbits (ph)
    And I click on Did you mean: suggestion displayed (ph)
    Then I should see an error message with below content (ph)
    """
    An error has occurred while searching: Search is currently too busy. Please try again later.
    """
