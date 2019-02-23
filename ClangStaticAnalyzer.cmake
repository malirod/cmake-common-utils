# Copyright [2019] <Malinovsky Rodion> (rodionmalino@gmail.com)

# Setup clang static analyzer target (enabled if toolchain is clang)
message(STATUS "Setup target: clang static analyzer")
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    if (CMAKE_GENERATOR STREQUAL "Unix Makefiles")
        message(STATUS "Using scan-build with make")
        set(SCAN_BUILDER "make")
    elseif (CMAKE_GENERATOR STREQUAL "Ninja")
        message(STATUS "Using scan-build with ninja")
        set(SCAN_BUILDER "ninja")
    else()
        message(STATUS "Skipping setup of clang static analyzer. Generator is not make or ninja.")
    endif()

    if (SCAN_BUILDER)
        add_custom_target(clang-static-analyzer
            COMMAND scan-build --use-analyzer=${CMAKE_CXX_COMPILER} ${SCAN_BUILDER}
            VERBATIM)
    endif()
else()
    message(STATUS "Skipping setup of clang static analyzer. Toolchain is not clang.")
endif()