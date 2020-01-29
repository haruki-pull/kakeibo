require 'rails_helper'

RSpec.describe 'Incomes', type: :system do

  income = FactoryBot.create(:income)

    xit "incomeの新規登録" do
        # トップページへアクセス
        visit root_path
        #収入を記録ボタンを押す
        
        # 値を全て入力せずCreate Incomeボタンを押す
        visit new_income_path
        click_on "Create Income"
        #income/newページをrender
        visit current_path
        #値を全て入力してCreate Incomeボタンを押す
        select 'カテゴリ', from: '給与'
        fill_in '金額',with: '1000'
        select 'カテゴリ', from: ''
        fill_in 'メモ',with: 'おいしい'
        click_on 'Create Income'
        #income/indexページにリダイレクト
        visit incomes_path
        #画面にincomeの情報がある
        expect(page).to have_content 'おいしい'
    end

    it "incomeの更新" do
      #indexページにログイン
      visit incomes_path
      #登録されたincomeデータの「おいしい」の文字が表示されている
      expect(page).to have_content 'おいしい'
      #編集ボタンを押す
      income = Income.find_by(id: 1)
      expect(page).to have_link '編集', href: edit_income_path(income)
      click_link '編集', href: edit_income_path(income)
      #更新ボタンを押す'/tasks/new'
      click_on "更新", href: income_path(income)
      #編集に成功しましたのflashが表示される
      expect(page).to have_content '編集に成功しました'
    end

    it "incomeの削除" do
        
    end

end