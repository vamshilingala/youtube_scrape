class CreateYoutubeContents < ActiveRecord::Migration[6.1]
  def change
    create_table :youtube_contents do |t|
  
      t.string :url
      t.string :title
      
      t.timestamps
    end
  end
end
