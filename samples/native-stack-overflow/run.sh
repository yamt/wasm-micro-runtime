#! /bin/sh

NAME=${1:-test1}

echo "====== Interpreter"
out/native-stack-overflow out/wasm-apps/testapp.wasm ${NAME}

echo
echo "====== Interpreter WAMR_DISABLE_HW_BOUND_CHECK=1"
out/native-stack-overflow.WAMR_DISABLE_HW_BOUND_CHECK out/wasm-apps/testapp.wasm ${NAME}

echo
echo "====== AOT"
out/native-stack-overflow out/wasm-apps/testapp.wasm.aot ${NAME}

echo
echo "====== AOT WAMR_DISABLE_HW_BOUND_CHECK=1"
out/native-stack-overflow.WAMR_DISABLE_HW_BOUND_CHECK out/wasm-apps/testapp.wasm.aot.bounds-checks ${NAME}