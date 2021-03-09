class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string     :title, null: false
      t.text       :description, null: false
      t.datetime   :start_date, null: false
      t.datetime   :end_date, null: false
      t.boolean    :active, default: false
      t.decimal    :goal, precision: 10, scale: 2

      t.timestamps
    end
  end
end
