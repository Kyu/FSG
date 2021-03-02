include(ExternalProject)

set(libgpg_error_URL "https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.41.tar.bz2")
set(libgpg_error_INSTALL "${CMAKE_CURRENT_BINARY_DIR}/third_party/libgpg_error")
message("Downloading from ${libgpg_error_URL}")


ExternalProject_Add(gpg_error
        PREFIX libgpg_error
        URL ${libgpg_error_URL}
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND
        ./autogen.sh && ./configure --prefix=<INSTALL_DIR> --enable-static=yes
        BUILD_COMMAND
        make check
        INSTALL_COMMAND
        make install
        INSTALL_DIR ${libgpg_error_INSTALL}
        LOG_DOWNLOAD 1
        LOG_UPDATE 1
        LOG_CONFIGURE 1
        LOG_BUILD 1
        )