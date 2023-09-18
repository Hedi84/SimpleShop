class CreateRules < ActiveRecord::Migration[7.0]
  def change
    create_table :rules do |t|
      t.string :name
      t.float :discount
      t.references :ruling, polymorhpic: true, null: false

      t.timestamps
    end
  end
end
