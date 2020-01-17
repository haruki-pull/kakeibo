class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :category
      t.integer :price
      t.datetime :date
      t.string :memo

      t.timestamps
    end
  end
end
