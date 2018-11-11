with import <nixpkgs> {};

let
  ps = emacsPackagesNgGen emacs;
  melpaBuild = ps.melpaBuild;
  extraPackages = with ps;
    (callPackage ./overlays/emacs-snippets { })
    // (callPackage ./overlays/highlight-escape-sequences { })
    // (callPackage ./overlays/org-bullets { })
    // (callPackage ./overlays/org-yt { })
    // (callPackage ./overlays/rotate-text { })
    // {
      evil-escape = (evil-escape.overrideAttrs (attrs: {
        patchPhase = ''
          sed -i 's|^ ;;;|;;;|' *.el
        '';
      }));}
    ;
  # Combine everything, probably a bad idea.
  epkgs = ps.orgPackages
    // ps.elpaPackages
    // ps.melpaPackages
    // extraPackages;
in

ps.emacsWithPackages ( import ./emacs-pkgs.nix { inherit pkgs epkgs; } )
