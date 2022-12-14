class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :user, foreign_key: { to_table: 'users' }
      t.string :name
      t.string :image_data

      t.timestamps
    end
  end
end
