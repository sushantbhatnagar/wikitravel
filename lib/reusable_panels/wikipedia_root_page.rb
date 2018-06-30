# Wiki Root Page - Contains the common elements required on all Wiki pages
class WikiRootPage
  include PageObject
  include DataMagic
  include FigNewton

  # waits on the page until the element expected is visible
  def initialize_page
    has_expected_element_visible?
  end
end
