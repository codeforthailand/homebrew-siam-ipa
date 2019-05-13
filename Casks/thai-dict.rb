cask 'thai-dict' do
    version '1.0.1'
  
    url "https://www.dropbox.com/s/dl/bfwer9f3fjmnuwq/mac-thai-dict-#{version}.pkg"
    sha256 "c4832b5d57106b47d3af36b2c562ced348fd25462727a92730291aa828f0a926"

    pkg "mac-thai-dict-#{version}.pkg"
  
    uninstall pkgutil: 'com.infinisoft.thaiDictionaries.thaiDictionaries.pkg'
 end