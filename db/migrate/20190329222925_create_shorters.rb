class CreateShorters < ActiveRecord::Migration[5.2]
  def change
    create_table :shorters do |t|
      t.string :original_url
      t.string :shorted_url
      t.datetime :expire_time
      t.integer :redirect_counter

      t.timestamps
    end
  end
end
