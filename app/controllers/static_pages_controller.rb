class StaticPagesController < ApplicationController
  
  def home
    @incomes = Income.all
    if params[:category].present?
      @incomes = @incomes.get_by_category params[:category]
      end
      if params[:gender].present?
      @users = @users.get_by_gender params[:gender]
      end
    # today = Date.today
    # this_year = today.year
    # this_month = today.month
    # @this_month_incomes = Income.where(date:this_month)
  end

  # def index
  #   @name = current_user.name
  #   time = Time.now
  #   this_month = time.month
  #   @income_budget = Budget.find_by(month: this_month).income_amount
  #   @spending_budget = Budget.find_by(month: this_month).spending_amount
  
  #   以下問題箇所（月ごとには取得できるが「今年の今月のみ」を条件として取得したい）
  #   @current_income = Income.group("YEAR(date)").group("MONTH(date)").select(date: this_month).sum(:amount)
  
  #   binding.pry
  # end

  def fork
  end
end
