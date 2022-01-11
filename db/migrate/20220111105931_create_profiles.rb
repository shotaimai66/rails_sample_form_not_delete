class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.string :address
      t.string :tel
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
