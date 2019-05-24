require 'csv'
require 'fileutils'
require 'erubis'
require 'open-uri'
require 'digest'
require 'zip'
require 'CGI'

TMP_DIR = "./tmp"
FILE_PATH = "./data/f0nt.csv"
FONT_CASK_TEMPLATE = "./data/templates/f0nt.cask"
FONT_COLLECTION_TEMPLATE = "./data/templates/f0nt.collection"
COLLECTION_VERSION = "1.0"

CASK_DIR = "./Casks"

FileUtils.mkdir(TMP_DIR) unless File.exist?(TMP_DIR)

fonts = CSV.read(FILE_PATH, :headers => true).map{ |r|
        r.to_hash
    }
    .select { |f| f["included"] == "1" }

puts "Generate #{fonts.length} fonts"

font_template = Erubis::Eruby.new(File.read(FONT_CASK_TEMPLATE))

fonts.each { |f| 
    puts "Generating cask for #{f["slug"]} #{f["total_downloads"]}"

    filepath = "#{CASK_DIR}/font-f0nt-#{f["slug"]}.rb"

    content = open(f['file_path']).read

    File.open("#{TMP_DIR}/tmp.zip", "wb") do |empty_file|
        open(f['file_path'], 'rb') do |read_file|
          empty_file.write(read_file.read)
        end
    end

    sha256 = Digest::SHA256.file "#{TMP_DIR}/tmp.zip"
    f['sha256'] = "#{sha256}" 
    f['url'] = CGI::unescape(f['url'])

    # todo: check whether file exist 
    # if yes and sha256 != sha then create new one.

    if File.exist?(filepath) then
        puts " file already exits"
    
        file_content = File.open(filepath, 'r').read

        old_sha256 = file_content.match(/sha256 "(.+)"/)[1]
        version = file_content.match(/version "(.+)"/)[1].to_f

        f['version'] = version

        if old_sha256.strip == f['sha256'] then
            puts " same sha256, skip this font"
            0
        else
            version = version + 0.1
            f['version'] = version
            puts " update sha256, and bump version"
        end
    end

    # create new file
    font_files = []
    Zip::File.open("#{TMP_DIR}/tmp.zip") do |zip_file|
        font_files = zip_file.select do |entry|
            entry.name.match(/[^__].+\.ttf$/i)
        end
    end 

    f["font_files"] = font_files

    rendered_cask = font_template.result(f)

    File.open(filepath, 'w') do |file|
        file.write(rendered_cask)
    end
}

font_col_template = Erubis::Eruby.new(File.read(FONT_COLLECTION_TEMPLATE))

rendered_collection = font_col_template.result(
    :version => COLLECTION_VERSION,
    :fonts => fonts
)

File.open("#{CASK_DIR}/font-collection-f0nt.rb", 'w') do |file|
    file.write(rendered_collection)
end

FileUtils.rm_rf(TMP_DIR)