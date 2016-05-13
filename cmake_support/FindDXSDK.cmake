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
#  DXSDK_DSOUND_LIBRARY - Path to dsound.lib/dll(.a)
#

if(NOT WIN32)
  message(FATAL_ERROR "FindDXSDK.cmake: Unsupported platform ${CMAKE_SYSTEM_NAME}" )
elseif(MSVC)
  set(DXSDK_DIR $ENV{DXSDK_DIR})
  find_path(DXSDK_ROOT_DIR
    include/dxsdkver.h
    HINTS
      $ENV{DXSDK_DIR}
  )
  find_path(DXSDK_INCLUDE_DIR
    dxsdkver.h
    PATHS
      ${DXSDK_ROOT_DIR}/include
  )
  find_path(DXSDK_LIBRARY_DIR
    dsound.lib
    HINTS
    ${DXSDK_ROOT_DIR}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
  )
  find_library(DXSDK_DSOUND_LIBRARY
    dsound
    HINTS
    ${DXSDK_ROOT_DIR}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
  )
endif(NOT WIN32)

# handle the QUIETLY and REQUIRED arguments and set DXSDK_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(DXSDK DEFAULT_MSG DXSDK_ROOT_DIR DXSDK_INCLUDE_DIR)

MARK_AS_ADVANCED(
    DXSDK_ROOT_DIR DXSDK_INCLUDE_DIR
    DXSDK_LIBRARY_DIR DXSDK_DSOUND_LIBRARY
)
