require 'rake'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'pry'
require 'csv'
require 'rest-client'
require 'json'
class TwitterScrapperService
    def scrape(url)
        print(url)
    end
end
obj=TwitterScrapperService.new
obj.scrape("https://twitter.com/munster_gene/status/1486476067632201729")