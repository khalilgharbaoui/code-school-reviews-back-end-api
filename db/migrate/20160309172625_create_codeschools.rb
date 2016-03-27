class CreateCodeschools < ActiveRecord::Migration
  def change
    create_table :codeschools do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :logo

      t.timestamps null: false
    end
  end
end
