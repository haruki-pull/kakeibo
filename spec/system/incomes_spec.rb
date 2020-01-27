require 'rails_helper'

RSpec.describe 'Incomes', type: :system do
  before do
    @incomes = FactoryBot.create(:income)
  end

    it "incomeの新規登録" do
        # トップページへアクセス
        visit root_path
        #収入を記録ボタンを押す
        click_on '収入を記録'
        #値を全て入力せずCreate Incomeボタンを押す
        visit new_income_path
        fill_in 'category',with: '給与'
        fill_in '金額',with: ''
        fill_in '日付',with: ''
        fill_in 'メモ',with: ''
        
        click_button 'Create Income'
        #income/newページをrender
        visit current_path
        #値を全て入力してCreate Incomeボタンを押す
        fill_in 'カテゴリ',with: '給与'
        fill_in '金額',with: '1000'
        fill_in '日付',with: '2.years.ago'
        fill_in 'メモ',with: 'おいしい'
        click_on 'Create Income'
        #income/indexページにリダイレクト
        visit incomes_path
        #画面にincomeの情報がある
        expect(page).to have_content 'おいしい'
    end

    it "incomeの更新" do
        
    end

    it "incomeの削除" do
        
    end

end