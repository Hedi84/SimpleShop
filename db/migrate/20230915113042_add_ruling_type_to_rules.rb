class AddRulingTypeToRules < ActiveRecord::Migration[7.0]
  def change
    change_table :rules do |t|
      t.string :ruling_type, null: false
    end
  end
end
