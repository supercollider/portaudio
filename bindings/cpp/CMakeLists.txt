# slowriot https://github.com/slowriot/portaudio-mingw-w64
# Prepared for inclusion of C++ bindings
INCLUDE_DIRECTORIES(include)

SET(PA_CXX_SOURCES
    source/portaudiocpp/BlockingStream.cxx
    source/portaudiocpp/CallbackInterface.cxx
    source/portaudiocpp/CallbackStream.cxx
    source/portaudiocpp/CFunCallbackStream.cxx
    source/portaudiocpp/CppFunCallbackStream.cxx
    source/portaudiocpp/Device.cxx
    source/portaudiocpp/DirectionSpecificStreamParameters.cxx
    source/portaudiocpp/Exception.cxx
    source/portaudiocpp/HostApi.cxx
    source/portaudiocpp/InterfaceCallbackStream.cxx
    source/portaudiocpp/MemFunCallbackStream.cxx
    source/portaudiocpp/Stream.cxx
    source/portaudiocpp/StreamParameters.cxx
    source/portaudiocpp/System.cxx
    source/portaudiocpp/SystemDeviceIterator.cxx
    source/portaudiocpp/SystemHostApiIterator.cxx)

ADD_LIBRARY(portaudiocpp SHARED ${PA_CXX_SOURCES})
TARGET_LINK_LIBRARIES(portaudiocpp portaudio)

ADD_LIBRARY(portaudiocpp_static STATIC ${PA_CXX_SOURCES})
