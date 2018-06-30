require 'spec_helper'

describe 'Wikipedia Landing Page' do
  it 'should have a "Wikipedia" title displayed' do
    visit WikipediaLandingPage
    expect(on(WikipediaLandingPage).wiki_title_element.text.upcase).to eql 'WIKIPEDIA'
  end
end
