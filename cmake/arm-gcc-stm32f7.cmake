# cmake/arm-gcc-stm32f7.cmake
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Compilers
set(CMAKE_C_COMPILER   arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_AR           arm-none-eabi-ar)
set(CMAKE_RANLIB       arm-none-eabi-ranlib)

# Don't try to run test binaries on host
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# CPU / FPU — match your project
set(MCPU_FLAGS "-mcpu=cortex-m7 -mthumb -mfpu=fpv5-d16 -mfloat-abi=hard")

# Common flags (adjust to your policy)
set(COMMON_C_FLAGS "-Os -g3 -ffunction-sections -fdata-sections -fno-builtin -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables")
set(CMAKE_C_FLAGS_INIT "${MCPU_FLAGS} ${COMMON_C_FLAGS} -std=c11")

# Linker flags only matter if something links; msgpack-c builds a .a (archi
