class CreateWatchlists < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlists do |t|
      t.string :user_id
      t.string :movie_id
      t.timestamps
    end
  end
end
