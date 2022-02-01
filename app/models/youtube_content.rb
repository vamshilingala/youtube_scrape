class YoutubeContent < ApplicationRecord
    validates :title, presence: true
    has_one :youtube_metric
    #self.primary = "content_id"
    

end
