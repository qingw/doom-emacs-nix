;;; get-packages.el --- description -*- lexical-binding: t; -*-
;;; (provide 'get-packages)

(require 'core (expand-file-name "doom-emacs/core/core"))(require 'core (expand-file-name "doom-emacs/core/core"))

(setq pkgs (doom-get-packages))

(defun p (x) (message (prin1-to-string x)))

;; (defun mk-package (pkg)
;;   (let* ((name (prin1-to-string (first pkg)))
;;          (recipe (plist-get (cdr pkg) :recipe))
;;          (recipe-as-str (prin1-to-string (prin1-to-string recipe)))
;;          (owner-repo-str (plist-get (cdr recipe) :repo))
;;          (owner-repo (split-string owner-repo-str "/"))
;;          (owner (first owner-repo))
;;          (repo (second owner-repo))
;;          (cmd (string-join
;;                (list "bash manual.sh" name owner repo recipe-as-str) " "))
;;          (x (p cmd))
;;          )
;;     (shell-command cmd)))
(defun mk-package (pkg)
  (let* ((name (prin1-to-string (first pkg)))
         (recipe (plist-get (cdr pkg) :recipe))
         (recipe-as-str (prin1-to-string (prin1-to-string recipe)))
         (owner-repo-str (plist-get (cdr recipe) :repo))
         (owner-repo (split-string owner-repo-str "/"))
         (owner (first owner-repo))
         (repo (second owner-repo)))

    ; TODO don't appent to existing files
    (append-to-file (prin1-to-string recipe) nil (concat "/tmp/melpa-recipes/" name))))

(let* ((filtered (seq-filter
                  (lambda (pkg) (plist-get (cdr pkg) :recipe))
                  pkgs)))
  (mapcar 'mk-package filtered))

;;; get-packages.el ends here
