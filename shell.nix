with import <nixpkgs> {};

let
  ps = emacsPackagesNgGen emacs;
  melpaBuild = ps.melpaBuild;
  extraPackages = with ps;
    # there must be a better way
    (builtins.foldl'
        (acc: s: acc // (callPackage (./overlays + ("/" + s)) {}))
        { }
        (builtins.attrNames (builtins.readDir ./overlays)))
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
