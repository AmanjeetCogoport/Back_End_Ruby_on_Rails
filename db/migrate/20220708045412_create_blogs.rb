class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.integer :blog_id
      t.string :title
      t.string :content
      t.string :author_name

      t.timestamps
    end
  end
end
