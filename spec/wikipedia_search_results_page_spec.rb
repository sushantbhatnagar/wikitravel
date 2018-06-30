require 'spec_helper'

describe 'Wikipedia Search Results Page' do
  it 'should have an error message displayed when the search results server is down' do
    visit WikipediaLandingPage
    on(WikipediaLandingPage) do |landing_page|
      landing_page.wiki_search_box_element.set 'furry rabbits'
      landing_page.wiki_search
    end

    on(WikipediaSearchResultsPage) do |search_results_page|
      search_results_page.search_dym_suggestion
      expect(search_results_page.search_results_error_message_element.text).to eql 'An error has occurred while searching: Search is currently too busy. Please try again later.'
    end
  end
end
