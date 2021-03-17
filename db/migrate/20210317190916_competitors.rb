class Competitors < ActiveRecord::Migration[6.0]
  def change
    create_table :competitors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.decimal :progress, precision: 10, scale: 2

      t.timestamps
    end
  end
end
