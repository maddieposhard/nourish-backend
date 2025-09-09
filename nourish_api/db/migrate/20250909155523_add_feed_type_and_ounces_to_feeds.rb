class AddFeedTypeAndOuncesToFeeds < ActiveRecord::Migration[8.0]
  def change
    add_column :feeds, :feed_type, :string
    add_column :feeds, :string, :string
    add_column :feeds, :ounces, :integer
  end
end
