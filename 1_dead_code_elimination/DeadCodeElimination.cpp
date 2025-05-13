#include "llvm/IR/PassManager.h"
#include "llvm/PassInfo.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include <vector>

using namespace llvm;

namespace llvm {

// LLVM New Pass : Dead Code Elimination
struct DeadCodeEliminationNewPass : public PassInfoMixin<DeadCodeEliminationNewPass> {
	// Run
	PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
		bool changed = true;
		while (changed) {
			changed = false;
			std::vector<Instruction *> EmptyUserInstructionList;
			for (Function::iterator FuncIter = F.begin(); FuncIter != F.end(); ++FuncIter) {
				for (BasicBlock::iterator BBIter = FuncIter->begin(); BBIter != FuncIter->end(); ++BBIter) {
					Instruction *I = cast<Instruction>(BBIter);
					if (I->user_empty()) EmptyUserInstructionList.push_back(I);
				}
			}

			for (auto *I : EmptyUserInstructionList) {
				if (I->isTerminator()) continue;
				if (I->mayHaveSideEffects()) continue;

				// Verbose
				outs() << "[REMOVED] ";
				I->print(outs());
				outs() << "\n";

				// Elimination
				changed = true;
				I->eraseFromParent();
			}
		}

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
			MPM.addPass(createModuleToFunctionPassAdaptor(DeadCodeEliminationNewPass()));
			return true;
		});
	};

	return {LLVM_PLUGIN_API_VERSION, "dead-code-elimination", "0.0.1", callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() { return getPassPluginInfo(); }
