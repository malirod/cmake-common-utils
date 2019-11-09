# Copyright [2019] <Malinovsky Rodion> (rodionmalino@gmail.com)

# Setup clang-tidy target (enabled if toolchain is clang)
message(STATUS "Setup target: clang-tidy")
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    find_program(CLANG_TIDY_EXE NAMES "clang-tidy")
    find_program(RUN_CLANG_TIDY_EXE NAMES "run-clang-tidy.py")

    if (NOT CLANG_TIDY_EXE)
        message(WARNING "clang-tidy not found!")
    endif()

    if (NOT RUN_CLANG_TIDY_EXE)
        message(WARNING "run-clang-tidy.py not found!")
    endif()

    if (CLANG_TIDY_EXE AND RUN_CLANG_TIDY_EXE)
        message(STATUS "Found clang-tidy and run-clang-tidy.py")
        set(CLANG_TIDY_HEADER_FILTER "'\/src\/|\/test\/'")

        add_custom_target(clang-tidy
            COMMAND ${RUN_CLANG_TIDY_EXE} -quiet -header-filter=${CLANG_TIDY_HEADER_FILTER}
            VERBATIM)
    endif()
else()
    message(STATUS "Skipping setup of clang-tidy. Toolchain is not clang.")
endif()