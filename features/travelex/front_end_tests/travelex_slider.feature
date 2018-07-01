Feature: Travelex Slider

  As a user
  I want to navigate to Travelex website
  So I can explore different options related travel money online

  @slider_to_buy_foreign_currency @functional_test
  Scenario: Verify I should see the third item title 'Buy foreign currency' on swiping left twice on sliders
    Given I am on the Travelex landing page
    And I resize the window to 550 pixels
    When I swipe the blocks sliders twice to the left side to view Buy foreign currency slider
    Then I should see the Buy foreign currency slider successfully
