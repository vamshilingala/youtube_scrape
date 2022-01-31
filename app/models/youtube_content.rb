class YoutubeContent < ApplicationRecord
    validates :title, presence: true
    has_one :youtube_metrics
    #self.primary = "content_id"
end
