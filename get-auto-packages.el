;;; get-packages.el --- description -*- lexical-binding: t; -*-
;;; (provide 'get-packages)

(require 'core (expand-file-name "doom-emacs/core/core"))

;;; Code:

(setq pkgs (doom-get-packages))

(let* ((filtered (seq-filter
                  (lambda (pkg) (not (plist-get (cdr pkg) :ignore)))
                  pkgs))
       (pkg-list (mapcar 'car filtered))
       (pkg-names (mapcar 'prin1-to-string pkg-list)))
  (append-to-file (string-join pkg-names "\n") nil "/dev/stdout"))

(provide 'get-auto-packages)
;;; get-auto-packages.el ends here
