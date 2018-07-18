require 'capybara/dsl'
# kse90017@molms.com
class BBCLogin

  include Capybara::DSL

  # Constants
  EMAIL_INPUT = 'username'
  PASSWORD_INPUT = 'password'
  DUMMY_EMAIL = 'kse90017@molms.com'
  SHORT_EMAIL = 'k'
  INVALID_EMAIL = 'hyuyfjhv@testingsdf.com'
  NOT_EMAIL = 'hyuyfjhv@"testingsdf.com'
  DUMMY_PASSWORD = 'password1!'
  SHORT_PASSWORD = 'p'
  LETTERS_PASSWORD = 'password'
  WRONG_PASSWORD = 'password1!oe'
  EMAIL_ERROR_ID = '#form-message-username'
  PASSWORD_ERROR_ID = '#form-message-password'
  GENERAL_ERROR_ID = '#form-message-general'

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

  def click_email
    find_field(EMAIL_INPUT).click
    sleep 1
  end

  def click_password
    find_field(PASSWORD_INPUT).click
    sleep 1
  end

  def fill_short_email
    fill_in(EMAIL_INPUT, with: SHORT_EMAIL)
    sleep 1
  end

  def fill_unregistered_email
    fill_in(EMAIL_INPUT, with: INVALID_EMAIL)
    sleep 1
  end

  def fill_not_email
    fill_in(EMAIL_INPUT, with: NOT_EMAIL)
    sleep 1
  end

  def fill_short_password
    fill_in(PASSWORD_INPUT, with: SHORT_PASSWORD)
    sleep 1
  end

  def fill_letters_password
    fill_in(PASSWORD_INPUT, with: LETTERS_PASSWORD)
    sleep 1
  end

  def fill_wrong_password
    fill_in(PASSWORD_INPUT, with: WRONG_PASSWORD)
    sleep 1
  end

  def check_blank_email
    find(EMAIL_ERROR_ID).visible?
  end

  def check_blank_password
    find(PASSWORD_ERROR_ID).visible?
  end

  def check_details_mismatch
    find(GENERAL_ERROR_ID).visible?
  end

  def missing_error
    has_content?('Something\'s missing. Please check and try again.')
  end

  def short_email_error
    has_content?('Sorry, that username\'s too short. It needs to be at least two characters.')
  end

  def invalid_email_error
    has_content?('Sorry, we can’t find an account with that email. You can register for a new account or get help here.')
  end

  def not_email_error
    has_content?('Sorry, that email doesn’t look right. Please check it\'s a proper email.')
  end

  def short_password_error
    has_content?('Sorry, that password is too short. It needs to be eight characters or more.')
  end

  def letters_password_error
    has_content?('Sorry, that password isn\'t valid. Please include something that isn\'t a letter.')
  end

  def mismatch_error
    has_content?('Sorry, those details don\'t match. Check you\'ve typed them correctly.')
  end

  def incorrect_password_error
    has_content?('Uh oh, that password doesn’t match that account. Please try again.')
  end

end
