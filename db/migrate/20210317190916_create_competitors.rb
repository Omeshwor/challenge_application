class CreateCompetitors < ActiveRecord::Migration[6.0]
  def change
    create_table :competitors do |t|
      t.references :user, null: false, foreign_key: {to_table: :users }
      t.references :challenge, null: false, foreign_key: true
      t.timestamps
    end
  end
end
