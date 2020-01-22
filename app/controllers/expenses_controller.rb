class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :show, :update, :destroy]
  # before_action :already_logged_in, only: [:edit, :show, :update, :destroy]
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expenses = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:success] = "ユーザー登録に成功しました"
      redirect_to @expense
    else
      render 'new'
    end
  end

  def update
    if @expense.update(expense_params)
      flash[:success] = "編集に成功しました"
      redirect_to action: 'index'
    else
      render 'show'
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