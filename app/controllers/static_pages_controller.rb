class StaticPagesController < ApplicationController
  
  def home
    today = Date.today
    this_month = today.all_month

    @this_month_incomes = Income.where(date: this_month)
    @this_month_expenses = Expense.where(date: this_month)
  end
end
