# Sylvan Haskell Example

A toy example showing how to get started with the
[Haskell bindings](https://github.com/adamwalker/sylvan-haskell) for
[Sylvan](https://github.com/utwente-fmt/sylvan).

## Usage

0. Install dependencies:

    ```
    sudo apt install hwloc libhwloc-dev libgmp-dev
    ```

1. Get, compile and install Sylvan: `make sylvan-clone-patch-make-install`

    Note that this will use `sudo` at the end to install the library
    globally, for example placing `libsylvan.a` into `/usr/local/lib/`
    which is therefore mentioned in the `stack.yaml` file here.

2. Compile the Haskell code: `stack build`

3. Run it: `stack exec sylvan-haskell-example`

## Notes

- Currently this example only works with Sylvan 1.0.0.
  To update, the Haskell bindings have to be updated first.
  Note that the Sylvan changelog says for version 1.7.0
  "Support for Sylvan as a shared library is removed."
