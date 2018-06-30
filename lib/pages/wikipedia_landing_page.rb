# Wikipedia Dashboard/Landing page
class WikipediaLandingPage < WikiRootPage

  page_url FigNewton.wiki_url

  expected_element_visible(:wiki_search_box, 30)
  text_field(:wiki_search_box, id: 'searchInput')

  div(:wiki_title, class: 'central-textlogo__image sprite svg-Wikipedia_wordmark')
  button(:wiki_search, class: 'pure-button pure-button-primary-progressive')
end
