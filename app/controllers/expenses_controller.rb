class ExpensesController < ApplicationController
    def index
      @expenses = ExpenseCollection.all
    end
    
    def new
      @expenses = ExpenseCollection.new
    end

    def create
      @expenses = ExpenseCollection.new(expenses_params)
      if @expenses.save
        redirect_to expenses_url
      else
        render :new
      end
    end

    def edit
      @expenses = ExpenseCollection.all
    end
    
    def update
      @expenses = expenses_params.to_unsafe_h.map do |id, expense_param|
        expense = ExpenseCollection.find(id)
        expense.update_attributes(expense_param)
        expense
      end
      redirect_to expenses_path
    end
    
    def destroy
      @expense = User.find(params[:id])
      @expense.destroy
      flash[:success] = "削除に成功しました"
      redirect_to  root_url
    end

    private
    
    def expenses_params
      params.require(:expenses) do |expense|
         ActionController::Parameters.new(expense.to_hash).permit(:category, :price, :date, :memo)
      end
    end

end
