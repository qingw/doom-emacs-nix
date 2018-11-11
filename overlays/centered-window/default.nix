{ callPackage }:
  {
    centered-window = callPackage ({ emacs
                                   , fetchFromGitHub
                                   , fetchurl
                                   , lib
                                   , melpaBuild }:
      melpaBuild {
        pname = "centered-window";
        ename = "centered-window";
        version = "20171127.149";
        src = fetchFromGitHub {
          owner = "anler";
          repo = "centered-window-mode";
          rev = "1234a364c9fa3a54087884ced2a7357b93fbb5d7";
          sha256 = "1z3zi6zy1z68g4sfiv21l998n04hbbqp660khind6ap8yjjn8ik8";
        };
        recipe = fetchurl {
          url = "https://raw.githubusercontent.com/sveitser/melpa/e5a35e0eec07cb51c25f7bc658315036b2057e74/recipes/centered-window";
          sha256 = "0bzm5ck2fc5gzh2drr58vbjf4azsmxz91fp3jv2zjb6l660w2jk1";
          name = "recipe";
        };
        packageRequires = [ emacs ];
        meta = {
          homepage = "https://melpa.org/#/centered-window";
          license = lib.licenses.free;
        };
      }) {};
  }