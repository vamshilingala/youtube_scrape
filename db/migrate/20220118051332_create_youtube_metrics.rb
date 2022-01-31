class CreateYoutubeMetrics < ActiveRecord::Migration[6.1]
  def change
    create_table :youtube_metrics do |t|
      t.integer :youtube_content_id
      t.string :likes
      t.string :views
      t.string :channel
      t.timestamps
    end

  end
end
