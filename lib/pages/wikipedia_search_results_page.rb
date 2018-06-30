# Wikipedia Search Results Page
class WikipediaSearchResultsPage < WikiRootPage

  expected_element_visible(:search_results_header, 30)
  h1(:search_results_header, id: 'firstHeading')

  div(:did_you_mean_suggestion, class: 'searchdidyoumean')
  link(:search_dym_suggestion, id: 'mw-search-DYM-suggestion')
  strong(:search_results_info, css: '.results-info>strong')
  links(:searched_all_articles, css: '.mw-search-results>li>div>a')
  div(:search_results_error_message, class: 'errorbox')
end
