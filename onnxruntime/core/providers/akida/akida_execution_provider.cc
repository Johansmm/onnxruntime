#include "akida_execution_provider.h"

namespace onnxruntime {
AkidaExecutionProvider::AkidaExecutionProvider(const AkidaExecutionProviderInfo& info)
    : IExecutionProvider{onnxruntime::kAkidaExecutionProvider}, info_{info} {}

}  // namespace onnxruntime
