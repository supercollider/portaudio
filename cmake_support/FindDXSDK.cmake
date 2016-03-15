# $Id: $
#
# - Try to find the DirectX SDK
# Once done this will define
#
#  DXSDK_FOUND - system has DirectX SDK
#  DXSDK_ROOT_DIR - path to the DirectX SDK base directory
#  DXSDK_INCLUDE_DIR - the DirectX SDK include directory
#  DXSDK_LIBRARY_DIR - DirectX SDK libraries path
#
#  DXSDK_DSOUND_LIBRARY - Path to dsound.lib
#

if(WIN32)
else(WIN32)
  message(FATAL_ERROR "FindDXSDK.cmake: Unsupported platform ${CMAKE_SYSTEM_NAME}" )
endif(WIN32)

if(MINGW)
  file(GLOB results "${CMAKE_SOURCE_DIR}/../dx*")
  foreach(f ${results})
    if(IS_DIRECTORY ${f})
      set(DXSDK_DIR ${DXSDK_DIR} ${f} CACHE PATH "DX SDK directory")
    endif()
  endforeach()
  find_path(DXSDK_ROOT_DIR
    include/dxsdkver.h
    HINTS
      ${DXSDK_DIR}
  )
elseif(MSVC)
  set(DXSDK_DIR $ENV{DXSDK_DIR})
  find_path(DXSDK_ROOT_DIR
    include/dxsdkver.h
    HINTS
      $ENV{DXSDK_DIR}
  )
endif(MINGW)

find_path(DXSDK_INCLUDE_DIR
  dxsdkver.h
  PATHS
    ${DXSDK_ROOT_DIR}/include
)

IF(CMAKE_LIBRARY_ARCHITECTURE STREQUAL "x64")
find_path(DXSDK_LIBRARY_DIR
  dsound.lib
  HINTS
  ${DXSDK_ROOT_DIR}/lib/x64
)
find_library(DXSDK_DSOUND_LIBRARY
  dsound
  HINTS
  ${DXSDK_ROOT_DIR}/lib/x64
)
ELSEIF(CMAKE_LIBRARY_ARCHITECTURE STREQUAL "x86")
find_path(DXSDK_LIBRARY_DIR
  dsound.lib
  HINTS
  ${DXSDK_ROOT_DIR}/lib/x86
)
find_library(DXSDK_DSOUND_LIBRARY
  dsound
  HINTS
  ${DXSDK_ROOT_DIR}/lib/x86
)
ENDIF()

# handle the QUIETLY and REQUIRED arguments and set DXSDK_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(DXSDK DEFAULT_MSG DXSDK_ROOT_DIR DXSDK_INCLUDE_DIR)

MARK_AS_ADVANCED(
    DXSDK_ROOT_DIR DXSDK_INCLUDE_DIR
    DXSDK_LIBRARY_DIR DXSDK_DSOUND_LIBRARY
)
