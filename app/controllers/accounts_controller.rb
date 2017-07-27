class AccountsController < ApplicationController
  before_action :set_account, only: %i[show destroy]
  before_action :set_current_user, only: %i[index create]

  attr_reader :accounts, :user

  def index
    @accounts = user.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.create(iban: Forgery('credit_card').number, balance: 1000)
    @account.roles.create(user: @user, role: 'owner')
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @account = Account.find(params[:id])
    @my_transactions = Transaction.where(user_id: current_user.id, account_id: params[:id])
    @income = Transaction.where(remote_account_id: @account.iban.to_s, status_to: false )
    @income.to_a
  end

  def destroy
    @account.destroy
    redirect_to :users
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def set_current_user
    @user = User.find(current_user.id)
  end
end
