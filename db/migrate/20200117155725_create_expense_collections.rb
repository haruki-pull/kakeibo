class CreateExpenseCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_collections do |t|

      t.timestamps
    end
  end
end
