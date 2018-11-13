{ fetchFromGitHub, melpaBuild, writeText, coreutils }:

melpaBuild {
  pname = "doom-emacs";
  version = "20181114";
  src = fetchFromGitHub {
    owner = "hlissner";
    repo = "doom-emacs";
    rev = "412063f452237894b295e7d8e6cabaa81f2257c5";
    sha256 = "1x2j6nircp9gb4ia3m042n7533akxqjb96x6mw50zqq9q9mcqc6l";
  };
  buildInputs = [ coreutils ];
  recipe = writeText "recipe" ''
    (doom-emacs :repo "hlissner/doom-emacs" :fetcher github)
  '';
  # buildPhase = ''
  #   # bash bin/doom c
  # '';
}
