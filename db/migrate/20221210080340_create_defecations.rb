class CreateDefecations < ActiveRecord::Migration[6.1]
  def change
    create_table :defecations do |t|
      t.references :user, null: false
      t.references :vital, null: false
      t.timestamps
    end
    add_index :defecations, [:user_id, :vital_id], unique: true
  end
end
