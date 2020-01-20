class IncomesController < ApplicationController
    def index
      @incomes = Income.all
    end
    
    def new
      @incomes = IncomeCollection.new
    end

    def create
      @incomes = IncomeCollection.new(incomes_params)
      if @incomes.save
        redirect_to incomes_url
      else
        render :new
      end
    end

    def edit
      @incomes = Income.all
    end
    
    def update
      @incomes = incomes_params.to_unsafe_h.map do |id, income_param|
        income = Income.find(id)
        income.update_attributes(income_param)
        income
      end
      flash[:success] = " omedetou"
      redirect_to incomes_path
      flash[:success] = " omedetou"
    end
    
    def destroy
    end

    private
    
    def incomes_params
      params.require(:incomes).permit(:id,:category, :price, :date, :memo)
    end
end
