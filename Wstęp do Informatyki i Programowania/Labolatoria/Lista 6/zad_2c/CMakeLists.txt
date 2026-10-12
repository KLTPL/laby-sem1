cmake_minimum_required(VERSION 3.10)

project(lista6_zad_2c C)

set(SOURCE_FILES
    hetmani.c
    src/str_to_int.c
)

add_executable(hetmani ${SOURCE_FILES})

target_include_directories(hetmani PRIVATE src)
