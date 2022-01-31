class YoutubeMetricsController < ApplicationController
    def self.new 
    end
    def self.create
    end

    def self.index
        @youtubemetrics = YoutubeMetric.all
      end
end
