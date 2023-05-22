# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-src"
  "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-build"
  "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-subbuild/readerwriterqueue-populate-prefix"
  "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-subbuild/readerwriterqueue-populate-prefix/tmp"
  "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-subbuild/readerwriterqueue-populate-prefix/src/readerwriterqueue-populate-stamp"
  "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-subbuild/readerwriterqueue-populate-prefix/src"
  "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-subbuild/readerwriterqueue-populate-prefix/src/readerwriterqueue-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-subbuild/readerwriterqueue-populate-prefix/src/readerwriterqueue-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/fumiaki/Desktop/Detector_test_sta/HFIR/Sophiread_HFIR/mcpevent2hist-next/sophiread_HFIR/build/_deps/readerwriterqueue-subbuild/readerwriterqueue-populate-prefix/src/readerwriterqueue-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
