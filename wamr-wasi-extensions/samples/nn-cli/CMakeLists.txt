# Copyright (C) 2025 Midokura Japan KK.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

cmake_minimum_required(VERSION 3.14)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED YES)

option(NN_CLI_FETCH_WAMR_WASI_EXTENSIONS "Download wamr-wasi-extentions" OFF)

if(NN_CLI_FETCH_WAMR_WASI_EXTENSIONS)
    set(URL https://github.com/yamt/wasm-micro-runtime/releases/download/WAMR-2.3.999/wamr-wasi-extensions-2.3.999.zip)

    include(FetchContent)
    FetchContent_Declare(
        wamr-wasi-extensions
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE
        URL ${URL}
    )
    FetchContent_MakeAvailable(wamr-wasi-extensions)
    list(APPEND CMAKE_PREFIX_PATH ${wamr-wasi-extensions_SOURCE_DIR})
endif()

find_package(wamr-wasi-nn REQUIRED)

project(nn-cli LANGUAGES C)
add_executable(nn-cli main.c fileio.c map.c)
find_package(wamr-wasi-nn REQUIRED)
target_link_libraries(nn-cli wamr-wasi-nn)
