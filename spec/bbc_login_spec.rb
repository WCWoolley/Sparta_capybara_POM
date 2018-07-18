require 'spec_helper'

describe 'Testing the BBC' do

  context 'testing login' do

    xit 'should respond with success when we login with a valid email and password' do
      @bbc_site_home = BBC_Site.new.bbc_homepage
      @bbc_site_home.visit_home_page
      @bbc_site_home.click_sign_in_link

      @bbc_site_login = BBC_Site.new.bbc_login
      @bbc_site_login.fill_email
      @bbc_site_login.fill_password
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_account).to be true
      @bbc_site_login.visit_account
      expect(@bbc_site_login.check_account_page).to be true
    end

    it 'should respond with success when we deliberately fail the login' do
      @bbc_site_home = BBC_Site.new.bbc_homepage
      @bbc_site_home.visit_home_page
      @bbc_site_home.click_sign_in_link

      @bbc_site_login = BBC_Site.new.bbc_login
      @bbc_site_login.click_email
      @bbc_site_login.click_password
      expect(@bbc_site_login.check_blank_email).to be true
      expect(@bbc_site_login.missing_error).to be true
      @bbc_site_login.click_email
      expect(@bbc_site_login.check_blank_password).to be true
      expect(@bbc_site_login.missing_error).to be true
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_blank_email).to be true
      expect(@bbc_site_login.check_blank_password).to be true
      expect(@bbc_site_login.missing_error).to be true
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_details_mismatch).to be true
      expect(@bbc_site_login.missing_error).to be true
      expect(@bbc_site_login.mismatch_error).to be true
      @bbc_site_login.fill_short_email
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_blank_email).to be true
      expect(@bbc_site_login.short_email_error).to be true
      @bbc_site_login.fill_short_password
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_blank_password).to be true
      expect(@bbc_site_login.short_password_error).to be true
      @bbc_site_login.fill_letters_password
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_blank_password).to be true
      expect(@bbc_site_login.letters_password_error).to be true
      @bbc_site_login.fill_unregistered_email
      @bbc_site_login.fill_password
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_blank_email).to be true
      expect(@bbc_site_login.invalid_email_error).to be true
      @bbc_site_home.visit_home_page
      @bbc_site_home.click_sign_in_link
      @bbc_site_login.fill_not_email
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_blank_email).to be true
      expect(@bbc_site_login.not_email_error).to be true
      @bbc_site_home.visit_home_page
      @bbc_site_home.click_sign_in_link
      @bbc_site_login.fill_email
      @bbc_site_login.fill_wrong_password
      @bbc_site_login.click_submit
      expect(@bbc_site_login.check_blank_password).to be true
      expect(@bbc_site_login.incorrect_password_error).to be true
    end

  end

end
