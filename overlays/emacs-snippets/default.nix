{ callPackage }:
  {
    emacs-snippets = callPackage ({ cl-lib ? null
                                  , emacs
                                  , fetchFromGitHub
                                  , fetchurl
                                  , lib
                                  , melpaBuild
                                  , yasnippet }:
      melpaBuild {
        pname = "emacs-snippets";
        ename = "emacs-snippets";
        version = "20181014.2204";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "emacs-snippets";
          rev = "fbff5b10666dd555fedf4c651cfefd185d04e2f5";
          sha256 = "12x1vjjjxvjiy75x8z8w722kw5pv8pfin6p2mq95pw24s7rdryqh";
        };
        recipe = fetchurl {
          url = "https://raw.githubusercontent.com/sveitser/melpa/e5a35e0eec07cb51c25f7bc658315036b2057e74/recipes/emacs-snippets";
          sha256 = "1jgxn6z30s02dw751qxlwsg6m746vjzxhgpdwp4gis4p04m1z926";
          name = "recipe";
        };
        packageRequires = [ cl-lib emacs yasnippet ];
        meta = {
          homepage = "https://melpa.org/#/emacs-snippets";
          license = lib.licenses.free;
        };
      }) {};
  }