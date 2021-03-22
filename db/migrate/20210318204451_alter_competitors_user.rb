class AlterCompetitorsUser < ActiveRecord::Migration[6.0]
  def change
    change_table :friendships do |t|
      t.references :competitor, references: :users, foreign_key: {to_table: :users}
    end
  end
end
