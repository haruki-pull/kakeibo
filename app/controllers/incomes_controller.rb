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
      @incomes = incomes_params.map do |id, income_param|
        income = Income.find(id)
        if income.update_attributes(income_param)
          flash[:success] = "編集に成功しました"
          income
        else
          flash[:success] = "編集に失敗しました"
        end
      end
      respond_with(@incomes, location: edit_income_path)
    end
    
    def destroy
    end

    private
    
    def incomes_params
      params.permit(incomes: [:category, :price, :date, :memo])[:incomes]
    end
end
