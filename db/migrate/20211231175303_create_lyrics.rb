class CreateLyrics < ActiveRecord::Migration[6.1]
  def change
    create_table :lyrics do |t|
      t.references :translation, null: false, foreign_key: true
      t.string :content
      t.integer :line

      t.timestamps
    end
  end
end
