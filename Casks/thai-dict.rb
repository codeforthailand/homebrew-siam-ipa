# This cask is largely based on https://github.com/ibotdotout/homebrew-mac-thai-dict
cask 'thai-dict' do
    version '1.0.1'
  
    url "https://storage.googleapis.com/codeforthailand/mac-thai-dict-#{version}.pkg"
    sha256 "c4832b5d57106b47d3af36b2c562ced348fd25462727a92730291aa828f0a926"
    name "Thai-Eng Dictionary by Infinisoft"
    homepage "https://www.macthai.com/2015/11/05/install-dictionary-th-en-on-mac-osx/"

    pkg "mac-thai-dict-#{version}.pkg"
    uninstall pkgutil: 'com.infinisoft.thaiDictionaries.thaiDictionaries.pkg'
 end