;;; init.el --- Bootstraps the full configuretion.  -*- lexical-binding: t; -*-

;;; Commentary:

;; This file bootstraps full configuretion.

;;; Code:

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(when (eq system-type 'darwin)
  (require 'init-mackeys))

;;; package.el
(setq package-quickstart t)
(package-initialize) ;; do not forget it
(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-elpa)

;; editing
(require 'init-evil)

;; appearance
(require 'init-look)
(require 'init-fonts)

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
