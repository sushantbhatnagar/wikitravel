Given(/^I am on the Wikipedia Landing page$/) do
  visit(WikipediaLandingPage)
end

When(/^I search for ([^"]*)$/) do |text_search|
  on(WikipediaLandingPage) do |landing_page|
    landing_page.wiki_search_box_element.set text_search
    landing_page.wiki_search
  end
end

Then(/^I should see ([^"]*) suggestion on search results page$/) do |suggestion|
  expect(on(WikipediaSearchResultsPage).did_you_mean_suggestion_element.text).to include suggestion
end

And(/^I click on Did you mean: suggestion displayed$/) do
  on(WikipediaSearchResultsPage).search_dym_suggestion
end

Then(/^I should see (\d+) results displayed on the Search Results page$/) do |number_of_results|
  results = on(WikipediaSearchResultsPage).search_results_info_element.text
  first_result_on_page = results.split(' ').first.to_i
  last_result_on_page = results.split(' ').last.to_i
  expect(last_result_on_page - first_result_on_page).to eql number_of_results

  # This is another way we can test if the search results count is 20 or not !!
  expect(on(WikipediaSearchResultsPage).searched_all_articles_elements.count).to eql number_of_results
end

And(/^I click on the first search result displayed on the Search Results page$/) do
  on(WikipediaSearchResultsPage) do |search_results_page|
    search_results_page.wait_until { search_results_page.searched_all_articles_elements.first.visible? }
    search_results_page.searched_all_articles_elements.first.click
  end
end

Then(/^I should see the title and table of contents for the article successfully$/) do
  on(WikipediaArticlesPage) do |article|
    expect(article.article_first_heading_element).to exist
    expect(article.article_table_of_contents_element).to exist
  end
end

Then(/^I should see an error message with below content$/) do |text|
  expect(on(WikipediaSearchResultsPage).search_results_error_message_element.text).to eql text
end