require 'rake'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'pry'
require 'csv'
require 'rest-client'
require 'json'
#url="https://www.youtube.com/watch?v=bMknfKXIFA8"
#uri=URI.parse(url)
#response= Net::HTTP.get_response(uri)
#puts response.body
#unparsed_page=Httparty.get(url)
#parse_page=Nokogiri::HTML(unparsed_page)
class YoutubeScrapperService
    def scrape(url)
        print url
        response=RestClient.get url
        #puts response.body.to_s
        input_string = response.body.to_s
        str1_markerstring = 'ytInitialData = '
        #str2_markerstring = '\/watch?v\x3dbMknfKXIFA8'
        #str2_markerstring = 'watchEndpoint'
        str2_markerstring= ';</script>'
        l=input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
        #puts(l)
        parsed_one= JSON.parse(l)
        parsed_two=parsed_one["contents"]["twoColumnWatchNextResults"]["results"]["results"]["contents"].map{|type|
            type["videoPrimaryInfoRenderer"]}[0]
        final_title=parsed_two["title"]["runs"][0]["text"]
        likes=parsed_two["videoActions"]["menuRenderer"]["topLevelButtons"][0]["toggleButtonRenderer"]["defaultText"]["accessibility"]["accessibilityData"]["label"]  
       
        views=parsed_two["viewCount"]["videoViewCountRenderer"]["viewCount"]["simpleText"]
        #pre_url=parsed_one["playerOverlays"]["playerOverlayRenderer"]["decoratedPlayerBarRenderer"]["decoratedPlayerBarRenderer"]["playerBar"]["multiMarkersPlayerBarRenderer"]["markersMap"][0]["value"]["chapters"][0]["chapterRenderer"]["thumbnail"]["thumbnails"][0]["url"]
        url1=parsed_one["contents"]["twoColumnWatchNextResults"]["secondaryResults"]["secondaryResults"]["results"][0]["compactVideoRenderer"]["videoId"]
        p url1
        #input_url = pre_url
        #str1_markerurl = "vi/"
        #str2_markerurl = "/hqdefault.jpg"

        #url1=input_url[/#{str1_markerurl}(.*?)#{str2_markerurl}/m, 1]
        #p "url subpart:"
        #p url1
        url="https://i.ytimg.com/vi/"+url1+"/hqdefault.jpg"
        channel=parsed_one["contents"]["twoColumnWatchNextResults"]["results"]["results"]["contents"][1]["videoSecondaryInfoRenderer"]["owner"]["videoOwnerRenderer"]["title"]["runs"][0]["text"]
        p url
        #p final_title
        #p likes
        #p views
        #p channel
        return {url: url, title: final_title, likes: likes, views: views,channel: channel}
        
        #p parsed_title["title"]
        
        
        #url_scrape="https://www.youtube.com/watch?v=bMknfKXIFA8"
        #html=open(url_scrape)
        #doc=Nokogiri::HTML(html)
        #puts doc.title
        #To extract likes
        #doc.xpath("//ytd-app/div/ytd-page-manager/ytd-watch-flexy/div[5]/div[1]/div/div[8]/div[2]/ytd-video-primary-info-renderer/div/div/div[3]/div/ytd-menu-renderer/div/ytd-toggle-button-renderer[1]/a/yt-formatted-string").each do |link|
        #    puts link
        #end
        #p doc.css('#content').text
        #returning empty list
        #p doc.css('.style-scope ytd-toggle-button-renderer style-text')
        #dislikes=doc.css('#style-scope ytd-toggle-button-renderer style-text')
        #puts dislikes
        #share=doc.css('#style-scope ytd-button-renderer style-default size-default')
        #puts share
        #title=doc.css('#style-scope ytd-video-primary-info-renderer')
        #puts title
        #comments=doc.css('#style-scope ytd-comments')
        #puts comments
        #updating data to csv file 
        #CSV.open("requirements.csv","a+") do |csv|
         #   csv<<[links]
    #end
    end
end         
obj=YoutubeScrapperService.new
obj.scrape("https://www.youtube.com/watch?v=2W5HjknSiZY")
