class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :site_name
      t.integer :post_per_page
      t.boolean :under_maintaenance
      t.boolean :prevent_commenting
      t.boolean :tag_visibility

      t.timestamps
    end
  end
end
