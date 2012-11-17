class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :username
      t.string :password
      t.string :url
      t.string :public_url
      t.integer :user_id

      t.timestamps
    end
  end
end
