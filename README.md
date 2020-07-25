# Extra D-lang tools for NixOS

Currently this overlay adds `dcd-client` and `dcd-server` commands only.

The D Completion Daemon is an auto-complete program for the D programming language.
See [DCD](https://github.com/dlang-community/DCD) repository.

## Installation

```
# Add overlay locally
git clone https://github.com/katyo/d-lang.nix ~/.config/nixpkgs/overlays

# Install package
nix-env -iA nixos.dcd
```

## Usage

See spacemacs [D-lang](https://develop.spacemacs.org/layers/+lang/d/README.html) page.

See also [DCD](https://github.com/dlang-community/DCD#client) usage guide.
