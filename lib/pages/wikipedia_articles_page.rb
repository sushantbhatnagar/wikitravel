# Wikipedia Articles Page
class WikipediaArticlesPage < WikiRootPage

  expected_element_visible(:wiki_articles_logo, 30)
  div(:wiki_articles_logo, id: 'p-logo')

  h1(:article_first_heading, id: 'firstHeading')
  div(:article_table_of_contents, id: 'toc')
end
