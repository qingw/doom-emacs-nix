{ callPackage }:
  {
    org-yt = callPackage ({ fetchFromGitHub
                          , fetchurl
                          , lib
                          , melpaBuild }:
      melpaBuild {
        pname = "org-yt";
        ename = "org-yt";
        version = "20180526.1745";
        src = fetchFromGitHub {
          owner = "TobiasZawada";
          repo = "org-yt";
          rev = "40cc1ac76d741055cbefa13860d9f070a7ade001";
          sha256 = "0jsm3azb7lwikvc53z4p91av8qvda9s15wij153spkgjp83kld3p";
        };
        recipe = fetchurl {
          url = "https://raw.githubusercontent.com/sveitser/melpa/e5a35e0eec07cb51c25f7bc658315036b2057e74/recipes/org-yt";
          sha256 = "1la8gdivqyf9fj8k0mbh41dqsdjc3zp4lk9m8bkfgfwm109h0fmj";
          name = "recipe";
        };
        packageRequires = [];
        meta = {
          homepage = "https://melpa.org/#/org-yt";
          license = lib.licenses.free;
        };
      }) {};
  }