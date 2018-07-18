require 'spec_helper'

describe 'Testing the BBC registration' do

  context 'initial user journey signing up' do

    xit 'should take us through the correct registration process with valid details' do
      @temp_email = BBC_Site.new.get_temp_email
      @temp_email.visit_minute_inbox
      email = @temp_email.get_email

      @bbc_site_home = BBC_Site.new.bbc_homepage
      @bbc_site_home.visit_home_page
      @bbc_site_home.click_sign_in_link
      @bbc_site_home.click_register_link

      @bbc_site_register = BBC_Site.new.bbc_registration
      @bbc_site_register.click_13_or_over
      @bbc_site_register.input_dob
      @bbc_site_register.submit_dob
      @bbc_site_register.input_email(email)
      @bbc_site_register.input_password
      @bbc_site_register.input_postcode
      @bbc_site_register.select_gender
      @bbc_site_register.no_thanks_email
      @bbc_site_register.click_registration
      expect(@bbc_site_register.check_signup).to be true
      # @bbc_site_register.click_continue
    end

  end

end
