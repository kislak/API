require 'rails_helper'

RSpec.describe 'accounts/index.html.haml', type: :view do
  context "accounts page" do
    before do
      @account1 = FactoryGirl.create (:account)
      @account2 = FactoryGirl.create (:account)
    end
    it "displays all the accounts" do
      @accounts = Account.all
      render

      expect(rendered).to have_content(@account1.iban)
      expect(rendered).to have_content('1000.0')
      expect(rendered).to have_link('New Account')
    end
  end

end
