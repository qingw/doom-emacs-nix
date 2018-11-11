{ callPackage }:
  {
    helm-describe-modes = callPackage ({ cl-lib ? null
                                       , emacs
                                       , fetchFromGitHub
                                       , fetchurl
                                       , helm
                                       , lib
                                       , melpaBuild }:
      melpaBuild {
        pname = "helm-describe-modes";
        ename = "helm-describe-modes";
        version = "20160211.2118";
        src = fetchFromGitHub {
          owner = "emacs-helm";
          repo = "helm-describe-modes";
          rev = "d2253c7c2bf4f28b9ff8a2d281bd7527c0106527";
          sha256 = "0li9bi1lm5ldwfpvzahxp7hyfd94jr1kl43rprx0myxb016yk2p5";
        };
        recipe = fetchurl {
          url = "https://raw.githubusercontent.com/sveitser/melpa/e5a35e0eec07cb51c25f7bc658315036b2057e74/recipes/helm-describe-modes";
          sha256 = "1wnyrv9m8r0p71pndsj39xwvw2bfa8vz36zi3aiabzxmscihh4nv";
          name = "recipe";
        };
        packageRequires = [ cl-lib emacs helm ];
        meta = {
          homepage = "https://melpa.org/#/helm-describe-modes";
          license = lib.licenses.free;
        };
      }) {};
  }