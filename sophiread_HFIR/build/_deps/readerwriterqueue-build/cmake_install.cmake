# Install script for directory: /Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/readerwriterqueue" TYPE FILE FILES
    "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-src/atomicops.h"
    "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-src/readerwriterqueue.h"
    "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-src/readerwritercircularbuffer.h"
    "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-src/LICENSE.md"
    )
endif()

