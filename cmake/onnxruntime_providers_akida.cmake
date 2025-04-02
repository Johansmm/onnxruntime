# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

file(GLOB_RECURSE onnxruntime_providers_akida_src CONFIGURE_DEPENDS
  "${ONNXRUNTIME_ROOT}/core/providers/akida/*.h"
  "${ONNXRUNTIME_ROOT}/core/providers/akida/*.cc"
)

source_group(TREE ${ONNXRUNTIME_ROOT}/core FILES ${onnxruntime_providers_akida_src})
onnxruntime_add_static_library(onnxruntime_providers_akida ${onnxruntime_providers_akida_src})
add_dependencies(onnxruntime_providers_akida ${onnxruntime_EXTERNAL_DEPENDENCIES})
onnxruntime_add_include_to_target(onnxruntime_providers_akida onnxruntime_common onnxruntime_framework onnx onnx_proto ${PROTOBUF_LIB} flatbuffers::flatbuffers Boost::mp11)
target_link_libraries(onnxruntime_providers_akida PRIVATE onnx onnxruntime_common onnxruntime_framework)
set_target_properties(onnxruntime_providers_akida PROPERTIES FOLDER "ONNXRuntime")
set_target_properties(onnxruntime_providers_akida PROPERTIES LINKER_LANGUAGE CXX)

install(TARGETS onnxruntime_providers_akida
        ARCHIVE   DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY   DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME   DESTINATION ${CMAKE_INSTALL_BINDIR}
        FRAMEWORK DESTINATION ${CMAKE_INSTALL_BINDIR})
