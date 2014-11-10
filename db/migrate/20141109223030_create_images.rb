class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :slug
      t.string :resource
      t.references :owner
    end

    add_index :images, :slug, unique: true
    add_index :images, :owner_id
  end
end
