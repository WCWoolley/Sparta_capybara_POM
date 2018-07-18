require 'capybara/dsl'

class BBC_Registration

  include Capybara::DSL

  # Constants
  OVER_13_LABEL = '13 or over'
  DAY_INPUT_NAME = 'dateOfBirthDay'
  MONTH_INPUT_NAME = 'dateOfBirthMonth'
  YEAR_INPUT_NAME = 'dateOfBirthYear'
  CONTINUE_ID = '#submit-button'
  INPUT_EMAIL_NAME = 'email'
  INPUT_PASSWORD_NAME = 'password'
  INPUT_POSTCODE_NAME = 'postcode'
  GENDER_INPUT_NAME = 'gender'
  EMAIL_UPDATES_CLASS = '.button__text-wrapper'
  CLICK_REGISTRATION_ID = '#submit-button'
  CLICK_CONTINUE_CLASS = 'Continue'

  def click_13_or_over
    click_link(OVER_13_LABEL)
    sleep 1
  end

  def input_dob
    fill_in(DAY_INPUT_NAME, :with => '6')
    fill_in(MONTH_INPUT_NAME, :with => '11')
    fill_in(YEAR_INPUT_NAME, :with => '1992')
    sleep 1
  end

  def submit_dob
    find(CONTINUE_ID).click
    sleep 1
  end

  def input_email(email)
    fill_in(INPUT_EMAIL_NAME, :with => email)
    sleep 1
  end

  def input_password
    fill_in(INPUT_PASSWORD_NAME, :with => 'password1!')
    sleep 1
  end

  def input_postcode
    fill_in(INPUT_POSTCODE_NAME, :with => 'M15SX')
    sleep 1
  end

  def select_gender
    select 'Male', from: GENDER_INPUT_NAME
    sleep 1
  end

  def no_thanks_email
    all(EMAIL_UPDATES_CLASS)[1].click
    sleep 1
  end

  def click_registration
    find(CLICK_REGISTRATION_ID).click
    sleep 1
  end

  def check_signup
    has_content?('Thanks. You\'re now signed in.')
  end

  # def click_continue
  #   click_link(CLICK_CONTINUE_CLASS)
  #   sleep 2
  # end

end
