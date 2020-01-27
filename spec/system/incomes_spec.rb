require 'rails_helper'

RSpec.describe 'Incomes', type: :system do
  before do
    @incomes = FactoryBot.create(:income)
  end

    it "かくにん" do
        byebug
    end


end