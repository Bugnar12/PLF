cmake_minimum_required(VERSION 3.25)
project(r1_model_cpp)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(r1_model_cpp
        lista.cpp
        lista.h
        main.cpp)
