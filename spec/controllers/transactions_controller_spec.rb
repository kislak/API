require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  before do
    @user = FactoryGirl.create :user
    sign_in @user
    @account = FactoryGirl.create :account
  end

end
