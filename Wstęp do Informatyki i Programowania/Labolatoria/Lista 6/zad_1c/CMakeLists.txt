cmake_minimum_required(VERSION 3.10)

project(lista6_zad_1c C)

set(SOURCE_FILES
    main.c
    src/permutations.c
    src/eightqueens.c
    src/str_to_int.c
  )

add_executable(main ${SOURCE_FILES})

target_include_directories(main PRIVATE src)
