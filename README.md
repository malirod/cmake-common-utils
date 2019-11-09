# Cmake common utils

Cmake helpers. Tested with cmake 3.13

## List of helpers

### ClangStaticAnalyzer

Add helper to run clang static analyzer. This will add target `clang-static-analyzer`.

```cmake
include(ClangStaticAnalyzer)
```

Usage: `make clang-static-analyzer`

### ClangTidy

Add helper to run clang tidy. Searches for `clang-tidy` binary.

```cmake
include(ClangTidy)
```

Setting are stored in `.clang-tidy`.

Run `make clang-tidy`

### DefaultDebug

Set Debug as default configuration.

```cmake
include(DefaultDebug)
```

### PreferCcache

Use ccache if available.

```cmake
include(PreferCcache)
```

### PreferClang

Use clang by default is available.

```cmake
include(PreferClang)
```

### PreferGoldLinker

Use gold linker by default is available.

```cmake
include(PreferGoldLinker)
```

### PrepareDoxygen

Add helper to generate documentation with help of doxygen. To generate html documentation run command `make doc`. Output will be in `<build dir>\doc\html`.

```cmake
include(PreferGoldLinker)
```

Used `<project root>/doc/Doxyfile.in` as project configuration.

### Conan

Helper to manage with conan package manager. Taken from https://github.com/conan-io/cmake-conan (ver 0.14)

```cmake
# Manage dependencies with Conan
include(Conan)
conan_check(VERSION 1.20.0 REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_BINARY_DIR}")
conan_add_remote(NAME bincrafters INDEX 1
            URL https://api.bintray.com/conan/bincrafters/public-conan)
conan_add_remote(NAME catchorg INDEX 2
            URL https://api.bintray.com/conan/catchorg/Catch2)
conan_cmake_run(REQUIRES Catch2/2.6.0@catchorg/stable boost_variant/1.69.0@bincrafters/stable
                BASIC_SETUP CMAKE_TARGETS
                GENERATORS cmake_find_package
                BUILD missing)
```
