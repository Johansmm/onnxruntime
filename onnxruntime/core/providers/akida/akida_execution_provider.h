// Copyright (C) Intel Corporation
// Licensed under the MIT License

#pragma once

#include "core/framework/execution_provider.h"
#include "core/graph/constants.h"

namespace onnxruntime {

// Information needed to construct CPU execution providers.
struct AkidaExecutionProviderInfo {
  bool create_arena{true};

  explicit AkidaExecutionProviderInfo(bool use_arena)
      : create_arena(use_arena) {}

  AkidaExecutionProviderInfo() = default;
};

// Logical device representation.
class AkidaExecutionProvider : public IExecutionProvider {
 public:
  // delay_allocator_registration = true is used to allow sharing of allocators between different providers that are
  // associated with the same device
  explicit AkidaExecutionProvider(const AkidaExecutionProviderInfo& info);

  std::shared_ptr<KernelRegistry> GetKernelRegistry() const override;
  std::unique_ptr<IDataTransfer> GetDataTransfer() const override;
  std::vector<AllocatorPtr> CreatePreferredAllocators() override;

 private:
  AkidaExecutionProviderInfo info_;
};

}  // namespace onnxruntime
