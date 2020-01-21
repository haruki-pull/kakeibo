class IncomesController < ApplicationController
    before_action :set_income, only: [:edit, :show, :update, :destroy]
    # before_action :already_logged_in, only: [:edit, :show, :update, :destroy]
    def index
      @incomes = Income.all
    end
  
    def show
      @income = Income.find(params[:id])
    end
  
    def new
      @income = Income.new
    end
  
    def edit
      @income = Income.find(params[:id])
    end
  
    def create
      @income = Income.new(income_params)
      if @income.save
        flash[:success] = "ユーザー登録に成功しました"
        redirect_to @income
      else
        render 'new'
      end
    end
  
    def update
      if @income.update(income_params)
        flash[:success] = "編集に成功しました"
        redirect_to action: 'index'
      else
        render 'show'
      end
  
    end
  
    def destroy
      @income.destroy
      flash[:success] = "削除に成功しました"
      redirect_to  root_url
    end
  
    private
      def set_income
        @income = Income.find(params[:id])
      end
  
      def income_params
        params.require(:income).permit(:category, :price, :date, :memo)
      end
    end