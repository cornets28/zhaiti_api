class AddChannelToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :channel
  end
end
