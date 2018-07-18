require 'spec_helper'

describe 'Testing the BBC' do

  context 'testing login' do

    it 'should respond with success when we login with a valid email and password' do
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

  end

end
