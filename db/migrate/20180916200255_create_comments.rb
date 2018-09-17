class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :place_id
      t.string :body
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
