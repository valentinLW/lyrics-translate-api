class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
