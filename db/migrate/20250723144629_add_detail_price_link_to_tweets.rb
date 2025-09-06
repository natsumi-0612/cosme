class AddDetailPriceLinkToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :detail, :text
    add_column :tweets, :price, :integer
    add_column :tweets, :link, :text
  end
end
