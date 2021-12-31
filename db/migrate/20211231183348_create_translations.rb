class CreateTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :translations do |t|
      t.references :song, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
