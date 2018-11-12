;;; get-packages.el --- description -*- lexical-binding: t; -*-
;;; (provide 'get-packages)

(require 'core (expand-file-name "doom-emacs/core/core"))(require 'core (expand-file-name "doom-emacs/core/core"))

(setq pkgs (doom-get-packages))

(defun mk-package (pkg)
  (let* ((name (prin1-to-string (first pkg)))
         (recipe (plist-get (cdr pkg) :recipe)))
    ; TODO don't appent to existing files
    (append-to-file (prin1-to-string recipe) nil (concat "/tmp/melpa-recipes/" name))))

(let* ((filtered (seq-filter
                  (lambda (pkg) (plist-get (cdr pkg) :recipe))
                  pkgs)))
  (mapcar 'mk-package filtered))

;;; get-packages.el ends here
