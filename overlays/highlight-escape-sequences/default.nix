{ callPackage }:
  {
    highlight-escape-sequences = callPackage ({ emacs
                                              , fetchFromGitHub
                                              , fetchurl
                                              , lib
                                              , melpaBuild }:
      melpaBuild {
        pname = "highlight-escape-sequences";
        ename = "highlight-escape-sequences";
        version = "20180921.813";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "highlight-escape-sequences";
          rev = "baa6994604b75e3df32a9dfab0f410fd45d11405";
          sha256 = "04bs1f09isvbia9v1mazqyfj86gdhfkdw751m2ixb1vhch3cjp5q";
        };
        recipe = fetchurl {
          url = "https://raw.githubusercontent.com/sveitser/melpa/e5a35e0eec07cb51c25f7bc658315036b2057e74/recipes/highlight-escape-sequences";
          sha256 = "0zlnxn4zb0s1mi5ffa11ra7f1xb2cggb2jw24wxmargkrc5sbnr0";
          name = "recipe";
        };
        packageRequires = [ emacs ];
        meta = {
          homepage = "https://melpa.org/#/highlight-escape-sequences";
          license = lib.licenses.free;
        };
      }) {};
  }