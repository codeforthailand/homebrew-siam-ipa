class ThaiDict < Formula
    version "1.0.1"
    url "https://www.dropbox.com/s/dl/p77opxpuiajq8w6/mac-thai-dict-#{version}.tar.gz"
    sha256 "c4832b5d57106b47d3af36b2c562ced348fd25462727a92730291aa828f0a926"
    desc "Thai-Eng Dictionary"

    def install
        puts "Test install siam-ipa"
        system "installer", 
            ""
    end
end