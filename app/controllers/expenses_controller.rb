class ExpensesController < ApplicationController
    def index
      @expenses = Income.all
    end
    
    def new
      @expenses = IncomeCollection.new
    end

    def create
      @expenses = IncomeCollection.new(expenses_params)
      if @expenses.save
        redirect_to expenses_url
      else
        render :new
      end
    end

    def edit
      @expenses = Income.all
    end
    
    def update
      @expenses = expenses_params.to_unsafe_h.map do |id, expense_param|
        expense = Income.find(id)
        expense.update_attributes(expense_param)
        expense
      end
      flash[:success] = " omedetou"
      redirect_to expenses_path
      flash[:success] = " omedetou"
    end
    
    def destroy
    end

    private
    
    def expenses_params
      params.require(:expenses) do |expense|
         ActionController::Parameters.new(expense.to_hash).permit(:category, :price, :date, :memo)
      end
    end

end
