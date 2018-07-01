class TravelexLandingPage
  include PageObject
  include DataMagic

  page_url FigNewton.travelex_url

  expected_element_visible(:set_destination, 60)
  div(:set_destination, class: 'ac-holder')
  link(:buy_foreign_currency_header, xpath: '//*[contains(@class,"slider")][3]/div//span/a')

  def initialize_page
    has_expected_element_visible?
  end

  def resize_window_scroll(pixels_value)
    @browser.driver.manage.window.resize_to(pixels_value, pixels_value)
    @browser.driver.execute_script("window.scrollBy(0,900)")
  end

  def focus_on_travelex_money_card_slider
    @browser.p(:xpath => '//*[contains(@class,"slider")][1]//div[@class="box-cont matchHeight"]/p').focus
  end

  def focus_on_international_money_transfer_slider
    @browser.p(:xpath => '//*[contains(@class,"slider")][2]//div[@class="box-cont matchHeight"]/p').focus
  end

  def swipe_left
    @browser.send_keys :arrow_right
  end

  def swipe_to_buy_foreign_currency_slider
    focus_on_travelex_money_card_slider
    swipe_left
    focus_on_international_money_transfer_slider
    swipe_left
  end
end
