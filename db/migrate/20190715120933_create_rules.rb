class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name
      t.text :rule1
      t.text :rule2
      t.text :rule3
      t.text :rule4
      t.text :rule5
      t.text :rule6
      t.text :rule7
      # t.references :user, foreign_key: true
      t.timestamps null: true
    end
  end
end
