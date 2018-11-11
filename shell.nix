with import <nixpkgs> {};

let
  ps = emacsPackagesNgGen ( emacs );
  melpaBuild = ps.melpaBuild;
  extraPackages = with ps; {
    emacs-snippets = callPackage ./manual/emacs-snippets {};
    helm-describe-modes = callPackage ./manual/helm-describe-modes {};
    highlight-escape-sequences = callPackage ./manual/highlight-escape-sequences {};
    org-bullets = callPackage ./manual/org-bullets {};
    org-yt = callPackage ./manual/org-yt {};
    rotate-text = callPackage ./manual/rotate-text {};
    evil-escape = ps.evil-escape.overrideAttrs (attrs: {
          patches = (attrs.patches or []) ++ [
            (pkgs.fetchpatch {
              url = https://github.com/BrianHicks/evil-escape/commit/b548e8450570a0c8dea47b47221b728c047a9baf.patch;
              sha256 = "1a2qrf4bpj7wm84qa3haqdg3pd9d8nh5vrj8v1sc0j1a9jifsbf6";
            })
          ];
    });
  };
  epkgs = ps.orgPackages
    // ps.elpaPackages
    // ps.melpaPackages
    // extraPackages;
in

emacsWithPackages ( callPackage ./emacs-pkgs.nix { inherit epkgs; })
