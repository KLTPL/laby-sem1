cmake_minimum_required(VERSION 3.10)

project(lista6_zad_3c C)

set(SOURCE_FILES
  mastermind.c
)

add_executable(mastermind ${SOURCE_FILES})

target_include_directories(mastermind PRIVATE src)
