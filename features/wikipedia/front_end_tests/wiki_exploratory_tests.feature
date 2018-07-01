@wiki_exploratory_tests
Feature: Wikipedia Exploratory Tests

  @language_options @functional_test
  Scenario: Verify I should see multiple language options to choose from on Wikipedia Landing Page
    Given I am on the Wikipedia Landing page
    Then I should see below language options to choose from on the landing page
      | English   |
      | 日本語       |
      | Español   |
      | Deutsch   |
      | Русский   |
      | Français  |
      | Italiano  |
      | 中文        |
      | Português |
      | Polski    |

  @wiki_app_via_itunes
  Scenario: Verify I should be able to navigate to the Apple App Store website successfully
      Given I am on the Wikipedia Landing page
      When I click the Download the iOS on the App Store link
      Then I should be navigated to the itunes website successfully

  @wiki_app_via_play_store
  Scenario: Verify I should be able to navigate to the Apple App Store website successfully
    Given I am on the Wikipedia Landing page
    When I click the Download for Android on Google Play link
    Then I should be navigated to the play.google website successfully
