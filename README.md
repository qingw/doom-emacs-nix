#### doom-emacs with nix

- Goal: Install `doom-emacs` with `nix`.
- State: Is a mess and does not work!

##### Usage

- `gen-auto-packages`: generate list of pkgs based on doom config.
- `gen-manual-packages`: generate nix description for packages missing from nixpkgs
/ melpa.
- Run `nix-shell` to build emacs.

##### Submodules

- `melpa` fork with extra packages.
- `emacs2nix` to generate packages. Needs path to change `melpa` URL (?)
- `doom-emacs` to generate list of packages.

##### TODO
- [ ] Clean up `shell.nix`.
- [ ] Dynamically load the generated packages.
- [ ] Test if doom actually works.
- [ ] Create a nix derivation for doom.
- [ ] Is there a better way -.-


Builds with the exception of `shrink-path` which fails with:

```
these derivations will be built:
  /nix/store/160liz6hra0jgz8nrpzcxdic7c9c8zd7-source.drv
  /nix/store/g77m19s9i1c0yly6c130r3gpz0780073-emacs-shrink-path-20170812.1947.drv
  /nix/store/qhjc1wqr550ay1vgn093y1jik9d161bj-emacs-packages-deps.drv
building '/nix/store/160liz6hra0jgz8nrpzcxdic7c9c8zd7-source.drv'...

trying https://gitlab.com/api/v4/projects/bennya%2Fshrink-path.el/repository/archive.tar.gz?sha=a94c80743280fe317cf56cd4d4cd6385ce9e3dfb
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
curl: (22) The requested URL returned error: 404 Not Found
error: cannot download source from any mirror
builder for '/nix/store/160liz6hra0jgz8nrpzcxdic7c9c8zd7-source.drv' failed with exit code 1
cannot build derivation '/nix/store/g77m19s9i1c0yly6c130r3gpz0780073-emacs-shrink-path-20170812.1947.drv': 1 dependencies couldn't be built
error: build of '/nix/store/g77m19s9i1c0yly6c130r3gpz0780073-emacs-shrink-path-20170812.1947.drv', '/nix/store/qhjc1wqr550ay1vgn093y1jik9d161bj-emacs-packages-deps.drv' failed
```


`evil-escape` needs patch until https://github.com/syl20bnr/evil-escape/pull/86 is merged.
