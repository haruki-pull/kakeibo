class ExpensesController < ApplicationController
  # before_action :set_expense, only: [:edit, :show, :update, :destroy]

  def index
    @expenses = Income.all
    if params[:category].present?
      @expenses = @expenses.get_by_category params[:category]
    end
  
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense =Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:success] = "登録に成功しました"
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def update
    if @expense.update(expense_params)
      flash[:success] = "編集に成功しました"
      redirect_to expenses_path
    else
      render 'edit'
    end

  end

  def destroy
    @expense.destroy
    flash[:success] = "削除に成功しました"
    redirect_to  root_url
  end

  private

    def set_expense
      @expense = Expense.find(params[:id])
    end
  
    def expense_params
      params.require(:expense).permit(:category, :price, :date, :memo)
    end
  end