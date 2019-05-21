require 'optparse'
require 'open-uri'
require 'nokogiri'
require 'csv'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: scrape-f0nt.rb [options]"
  opts.on('-t', '--trial') { |v| options[:trial_run] = true }
end.parse!

if options[:trial_run] then
    puts "Hey!, this is a trial run. MAX_PAGES is set to 1."
end

PAGINATION_URL = "https://www.f0nt.com/release/page/<PAGE_NO>"
MAX_PAGES = options[:trial_run] ? 1 : 64
CSV_PATH = "data/f0nt.csv"
VERSION = "1.0"

def scrapeListingPage url
    puts "Scraping listing page: #{url}"

    html = open(url)
    doc = Nokogiri::HTML(html)
    links = doc.search('#content p.title a').map{ |a| a.attr("href") }

    return links
end

def scrapeFontPage url
    puts "Scraping font page: #{url}"
    html = open(url)
    doc = Nokogiri::HTML(html)


    file_dom = doc.at("#download a")
    if file_dom.nil? then
        puts " > File for #{url} doesn't exist"
        return
    end 


    total_downloads = doc.at("#download").inner_text
        .match(/ดาวน์โหลดแล้ว ([0-9,]+) ครั้ง/)[1]
        .gsub(",", "")
        .to_i

    return {
        :font_name => doc.at("h2.title").inner_text,
        :author => doc.at("p.author a").inner_text,
        :file_path => file_dom.attr("href"),
        :url => url,
        :total_downloads => total_downloads,
        :version => VERSION
    }
end 

def write_csv items
    CSV.open(CSV_PATH, "w") do |csv|
        csv << items.first.keys
        items.each do |h|
            csv << h.values
        end
    end
 end

puts "Retrieving font urls from #{MAX_PAGES} pagination pages"

urls = (1 .. MAX_PAGES).to_a.map{ |a| PAGINATION_URL.gsub("<PAGE_NO>", a.to_s) }

font_urls = urls.map{ |a| scrapeListingPage(a) }.flatten()

puts "We have #{font_urls.length} fonts to scrape"

fonts = font_urls.map{ |a| scrapeFontPage(a) }
    .compact

puts "#{fonts.length} found!"

puts "Writing to #{CSV_PATH}"
write_csv(fonts)

puts "Done"