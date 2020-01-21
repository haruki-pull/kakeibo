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
      redirect_to incomes_path
    end
    
    def destroy
      @income = Income.find(params[:id])
      @income.destroy
      flash[:success] = "削除に成功しました"
      redirect_to  root_url
    end

    def destroy_all
      checked_data = params[:deletes].keys # ここでcheckされたデータを受け取っています。
      if Income.destroy(checked_data)
        redirect_to root_path
      else
        render action: 'index'
      end
    end

    private
    
    def incomes_params
      params.require(:incomes) do |income|
         ActionController::Parameters.new(income.to_hash).permit(:category, :price, :date, :memo)
      end
    end

end
