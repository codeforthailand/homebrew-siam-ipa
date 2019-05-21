require 'csv'
require 'fileutils'
require 'erubis'
require 'open-uri'
require 'digest'
require 'zip'

TMP_DIR = "./tmp"
FILE_PATH = "./data/f0nt.csv"
FONT_CASK_TEMPLATE = "./data/templates/f0nt.cask"
CASK_DIR = "./Casks"

FileUtils.mkdir(TMP_DIR) unless File.exist?(TMP_DIR)

fonts = CSV.read(FILE_PATH, :headers => true).map{ |r|
    r.to_hash
}

font_template_en = Erubis::Eruby.new(File.read(FONT_CASK_TEMPLATE))

fonts.each { |f| 
    slug = f["url"].match(/release\/(.+)\//)[1]
    puts "Generating cask for #{slug}"

    content = open(f['file_path']).read

    File.open("#{TMP_DIR}/tmp.zip", "wb") do |empty_file|
        open(f['file_path'], 'rb') do |read_file|
          empty_file.write(read_file.read)
        end
    end

    f['sha256'] = Digest::SHA256.file "#{TMP_DIR}/tmp.zip"

    font_files = []
    Zip::File.open("#{TMP_DIR}/tmp.zip") do |zip_file|
        font_files = zip_file.select do |entry|
            entry.name.match(/[^_].+\.ttf$/i)
        end
    end 

    f["slug"] = slug
    f["font_files"] = font_files
    rendered_cask = font_template_en.result(f)

    File.open("#{CASK_DIR}/f0nt-#{slug}.rb", 'w') do |file|
        file.write(rendered_cask)
    end

}

# todo: select top x fonts
# generate bundle Cask

FileUtils.rm_rf(TMP_DIR)