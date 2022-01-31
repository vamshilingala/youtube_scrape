require 'rake' 
require 'nokogiri'
require 'open-uri' 
    doc=Nokogiri::HTML(URI.open("https://twitter.com/elonmusk/status/1487316787385581570"))
    #p doc
    l=doc.xpath("/html/body/div[1]/div/div/div[2]/main/div/div/div/div/div/section/div/div/div[1]/div/div[1]/article/div/div/div/div[3]/div[2]/div/div/div/div/div/a/div/div[2]/div/img")
    p l
