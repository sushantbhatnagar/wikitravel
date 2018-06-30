@wiki_search_results
Feature: Wikipedia Search Results

  As a user
  I want to navigate to Wikipedia website
  So I can search results on Wikipedia

  Background:
    Given I am on the Wikipedia Landing page
    When I search for furry rabbits

  # This is a unit test case scenario
  @wikipedia_title @unit_test @rspec_test
  Scenario: Verify the title of Wikipedia landing page is displayed as 'WIKIPEDIA'
    Given I am on the Wikipedia Landing page (ph)
    Then I should see the title on the landing page as WIKIPEDIA (ph)

  @suggestion @functional_test
  Scenario: Verify I should see 'Did you mean' suggestion on searching for 'Furry rabbits' results
    Then I should see Did you mean: suggestion on search results page

  @search_results @functional_test
  Scenario: Verify I should see 20 search results on clicking Did you mean: suggestion after my search
    And I click on Did you mean: suggestion displayed
    Then I should see 20 results displayed on the Search Results page

  @first_search_result_title_toc @regression_test
  Scenario: Verify I should see the title and topic of contents for the first search result displayed successfully
    And I click on Did you mean: suggestion displayed
    And I click on the first search result displayed on the Search Results page
    Then I should see the title and table of contents for the article successfully

    # This is a unit test case scenario
  @search_results_error_message @unit_test @rspec_test
  Scenario: Verify I should see an error message when the search server is not available
    And I click on Did you mean: suggestion displayed (ph)
    Then I should see an error message with below content (ph)
    """
    An error has occurred while searching: Search is currently too busy. Please try again later.
    """
