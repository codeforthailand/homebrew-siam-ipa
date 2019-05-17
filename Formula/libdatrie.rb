class Libdatrie < Formula
    desc ""
    homepage ""
    url "https://github.com/tlwg/libdatrie/releases/download/v0.2.12/libdatrie-0.2.12.tar.xz"
    sha256 "452dcc4d3a96c01f80f7c291b42be11863cd1554ff78b93e110becce6e00b149"
  
    def install
      system "./configure", "--prefix=#{prefix}"
      system "make"
      system "make", "install"
    end
  
    # test do
    #   system "make", "check"
    # end
  end