class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :destroy]

  def index
    @accounts = Account.all     
  end

  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new()
    @account.account_number = Forgery('credit_card').number

    if @account.save
    #  format.html { redirect_to @account, notice: 'Account was successfully created.' }
    end

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end

  end

  def show

  end

  def destroy
    @account.destroy
    #respond_to do |format|
    #  format.html { redirect_to account_url, notice: 'Profile was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
    redirect_to :profiles
  end


  private

  def set_account
    @account = Account.find(params[:id])
  end

  
  #def account_params
  #  params.fetch(:account).permit(:user_id)
  #end
end
