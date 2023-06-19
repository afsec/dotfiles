# ~/shell.nix
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages;
    [ 
      vim tmux rsync cacert
      curl git cmake tree
      unzip zstd iproute2 jq
      clang llvm lldb glibc pkg-config
      rustup musl
      cargo-audit cargo-deny cargo-vet
      wasm-pack wabt binaryen wasm-bindgen-cli trunk
      helix cocogitto difftastic watchexec
      sea-orm-cli
      nodejs_20
    ];
    shellHook = ''
      rustup default stable
      rustup component add rust-analyzer
      rustup target add wasm32-unknown-unknown
    '';
  }
