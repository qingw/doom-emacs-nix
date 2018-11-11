{ callPackage }:
  {
    org-bullets = callPackage ({ emacs
                               , fetchFromGitHub
                               , fetchurl
                               , lib
                               , melpaBuild }:
      melpaBuild {
        pname = "org-bullets";
        ename = "org-bullets";
        version = "20171015.1335";
        src = fetchFromGitHub {
          owner = "Kaligule";
          repo = "org-bullets";
          rev = "8b4f0aab6d49b00faa779785b978fdb67e2eb066";
          sha256 = "1v8x7bwghnp3qyf6hpdm0rzkjqly2v5p9kjyibkv808i4nfwxl9c";
        };
        recipe = fetchurl {
          url = "https://raw.githubusercontent.com/sveitser/melpa/e5a35e0eec07cb51c25f7bc658315036b2057e74/recipes/org-bullets";
          sha256 = "1cj42h4bkclhndjnp5w14rwxd93zhjmrccw9c0bis9bzrpi09nca";
          name = "recipe";
        };
        packageRequires = [ emacs ];
        meta = {
          homepage = "https://melpa.org/#/org-bullets";
          license = lib.licenses.free;
        };
      }) {};
  }