#include "llvm/IR/PassManager.h"
#include "llvm/PassInfo.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include <vector>

using namespace llvm;

namespace llvm {

// LLVM New Pass : Print Function Name
struct PrintFuncNameNewPass : public PassInfoMixin<PrintFuncNameNewPass> {
	// Run
	PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
		outs() << F.getName() << "\n";
		return PreservedAnalyses::all();
	}
	// isRequired
	static bool isRequired(void) { return true; }
};

} // namespace llvm

// Pass Registration
PassPluginLibraryInfo getPassPluginInfo() {
	const auto callback = [](PassBuilder &PB) {
		PB.registerOptimizerLastEPCallback([&](ModulePassManager &MPM, auto) {
			MPM.addPass(createModuleToFunctionPassAdaptor(PrintFuncNameNewPass()));
			return true;
		});
	};

	return {LLVM_PLUGIN_API_VERSION, "print-func-name", "0.0.1", callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() { return getPassPluginInfo(); }
