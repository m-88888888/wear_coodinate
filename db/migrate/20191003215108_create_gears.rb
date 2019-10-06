class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.string :url
      t.integer :article_id

      t.timestamps
    end
  end
end
