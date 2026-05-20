export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"
export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
export optflags="-Wno-error=implicit-function-declaration"
CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl@1.1`"
RUBY_CONFIGURE_OPTS="--with-openssl-dir=`brew --prefix openssl@3.6`"
ruby-install ruby 2.7.5
