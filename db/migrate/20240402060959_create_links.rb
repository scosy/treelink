class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :title
      t.text :source
      t.integer :views
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
