class CreateUserChallengeDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_challenge_details do |t|
      t.references :competitor, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.decimal :detail, precision: 10, scale: 2
      t.timestamps
    end
  end
end
