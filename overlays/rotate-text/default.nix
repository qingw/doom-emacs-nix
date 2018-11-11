{ callPackage }:
  {
    rotate-text = callPackage ({ fetchFromGitHub
                               , fetchurl
                               , lib
                               , melpaBuild }:
      melpaBuild {
        pname = "rotate-text";
        ename = "rotate-text";
        version = "20111203.1739";
        src = fetchFromGitHub {
          owner = "debug-ito";
          repo = "rotate-text.el";
          rev = "48f193697db996855aee1ad2bc99b38c6646fe76";
          sha256 = "02fkv45nbbqrv12czlinpr8qpsd7yjdhr628hl58n42w560qxrs8";
        };
        recipe = fetchurl {
          url = "https://raw.githubusercontent.com/sveitser/melpa/e5a35e0eec07cb51c25f7bc658315036b2057e74/recipes/rotate-text";
          sha256 = "01s53apcd3vmxk7x7x56kw9qi27nn10lkgh9lwmvwzghja29hkmr";
          name = "recipe";
        };
        packageRequires = [];
        meta = {
          homepage = "https://melpa.org/#/rotate-text";
          license = lib.licenses.free;
        };
      }) {};
  }