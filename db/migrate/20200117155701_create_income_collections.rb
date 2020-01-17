class CreateIncomeCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :income_collections do |t|

      t.timestamps
    end
  end
end
