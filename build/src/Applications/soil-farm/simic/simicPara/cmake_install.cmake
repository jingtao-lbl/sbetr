# Install script for directory: /global/homes/j/jingtao/ReSOM/sbetr/src/Applications/soil-farm/simic/simicPara

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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimicPara.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimicPara.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimicPara.so"
         RPATH "/usr/local/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/simic/simicPara/libsimicPara.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimicPara.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimicPara.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimicPara.so"
         OLD_RPATH "/global/homes/j/jingtao/ReSOM/sbetr/build/lib:/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/cdom/cdomNlayer:/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/cdom/cdom1layer:/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/cdom/cdomPara:/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/ecacnp/ecacnpNlayer:/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/ecacnp/ecacnp1layer:/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/ecacnp/ecacnpPara:/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/bgcfarm_util:/global/homes/j/jingtao/ReSOM/sbetr/build/src/stub_clm:/global/homes/j/jingtao/ReSOM/sbetr/build/src/io_util:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_main:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_rxns:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_para:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_transport:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_core:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_bgc:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_echem:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_dtype:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_grid:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_math:/global/homes/j/jingtao/ReSOM/sbetr/build/src/betr/betr_util:/global/homes/j/jingtao/ReSOM/sbetr/build/src/esmf_wrf_timemgr:/global/homes/j/jingtao/ReSOM/sbetr/build/src/shr:"
         NEW_RPATH "/usr/local/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsimicPara.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/global/homes/j/jingtao/ReSOM/sbetr/build/src/Applications/soil-farm/simic/simicPara/CMakeFiles/simicPara.dir/install-cxx-module-bmi-noconfig.cmake" OPTIONAL)
endif()

