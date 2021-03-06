class RulesController < ApplicationController
  before_action :set_rule, only: %i[edit update]
  before_action :set_account, only: :index

  attr_reader :rule, :rules, :account

  def index
    @rules = account.rules
  end

  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)

    if rule.save
      redirect_to :account_rules
    else
      redirect_to :new_account_rule, notice: 'Invalid params.'
    end
  end

  def edit; end

  def update
    if rule.update(rule_params)
      redirect_to :edit_account_rule, notice: 'Rules have updated.'
    else
      redirect_to :edit_account_rule, notice: 'Rules have note updated. Invalid params.'
    end
  end

  private

  def set_rule
    @rule = Rule.find(params[:id])
  end

  def rule_params
    params.fetch(:account_rule).permit(:spending_limit)
  end

  def set_account
    @account = Account.find(params[:account_id])
  end
end
