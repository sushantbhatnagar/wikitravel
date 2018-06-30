require 'rspec'
require 'page-object'
require 'data_magic'
require 'fig_newton'
require 'watir'

require 'require_all'
require_all 'lib'

RSpec.configure do |config|
  config.include PageObject::PageFactory

  #TODO: Isolate the browser with the unit tests
  config.before do
    @browser = Watir::Browser.new :chrome
  end
end
