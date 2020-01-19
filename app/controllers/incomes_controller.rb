class IncomesController < ApplicationController

    def index
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
    end
    
    def update
    end
    
    def destroy
    end

    private
    
    def incomes_params
      params.require(:incomes)
    end
end
