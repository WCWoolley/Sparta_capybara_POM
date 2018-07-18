require 'capybara/dsl'
# kse90017@molms.com
class BBCLogin

  include Capybara::DSL

  # Constants
  EMAIL_INPUT = 'username'
  PASSWORD_INPUT = 'password'
  DUMMY_EMAIL = 'kse90017@molms.com'
  DUMMY_PASSWORD = 'password1!'

  def fill_email
    fill_in(EMAIL_INPUT, with: DUMMY_EMAIL)
    sleep 1
  end

  def fill_password
    fill_in(PASSWORD_INPUT, with: DUMMY_PASSWORD)
    sleep 1
  end

  def click_submit
    click_button 'Sign in'
    sleep 1
  end

  def check_account
    has_link?('Your account')
  end

  def visit_account
    click_link 'Your account'
    sleep 1
  end

  def check_account_page
    has_content?('Lovely to see you here')
  end

end
