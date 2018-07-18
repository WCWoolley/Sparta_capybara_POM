require 'capybara/dsl'

class BBC_Homepage

  include Capybara::DSL

  # Constants
  HOMEPAGE_URL = 'http://www.bbc.co.uk'
  SIGN_IN_LINK_ID = '#idcta-username'
  REGISTER_LINK_CLASS = '.link--primary'

  def visit_home_page
    visit(HOMEPAGE_URL)
    sleep 1
  end

  def click_sign_in_link
    find(SIGN_IN_LINK_ID).click
    sleep 1
  end

  def click_register_link
    find(REGISTER_LINK_CLASS).click
    sleep 1
  end

end
