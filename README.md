# Cmake common utils

Cmake helpers. Tested with cmake 3.12

## List of helpers

### ClangStaticAnalyzer

Add helper to run clang static analyzer. This will add target `clang-static-analyzer`.

```cmake
include(ClangStaticAnalyzer)
```

Usage: `make clang-static-analyzer`

### ClangTidy

Add helper to run clang tidy.

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

### SetupConan

Helper to setup dependencies with conan package manager. On configuration state toolchain is passed to `conan install ...` command.

```cmake
include(SetupConan)
```