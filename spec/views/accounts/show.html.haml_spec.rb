require 'rails_helper'
RSpec.describe 'accounts/show.html.haml', type: :view do
  context "account show page" do
    before do
      @account = FactoryGirl.create(:account)
    end
    it "displays account info like iban, transactions etc" do
      @account = Account.last
      render

      expect(rendered).to have_content(@account.iban)
      expect(rendered).to have_content(@account.balance)
      expect(rendered).to have_link('Back')
      expect(rendered).to have_content('Account Iban')
      expect(rendered).to have_content('Amount')
    end
  end

end