;;; init-site-lisp.el --- Settings for non-elpa packages.  -*- lexical-binding: t; -*-

;;; Commentary:

;; The `add-subdirs-to-load-path' is copied from manateelazycat.
;; See line 136 ~ 141 at https://manateelazycat.github.io/eaf/emacs/2020/05/10/eaf-community.html.

;;; Code:

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.emacs.d/site-lisp")

(when (require 'awesome-tab nil t)
  (and (display-graphic-p) (awesome-tab-mode t)))

(when (require 'nano-modeline nil t)
  (nano-modeline))

(provide 'init-site-lisp)
;;; init-site-lisp.el ends here
