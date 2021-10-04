;;; init.el --- Bootstraps the full configuretion.  -*- lexical-binding: t; -*-

;;; Commentary:

;; This file bootstraps full configuretion.

;;; Code:

(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "This Emacs is too old to use.-- You need to update to %s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst system-darwin-p (eq system-type 'darwin))
(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defvar ixnij/enable-pyim-p nil
  "Is pyim should be enable?")

(defvar ixnij/enable-emacs-rime-p t
  "Is emacs-rime should be enable?")

(when ixnij/enable-pyim-p
  (defvar ixnij/pyim-use-rime-p t
    "Should pyim use rime?"))

(defvar ixnij/meow-enable-p nil
  "Should we enable meow?")

(require 'init-native-comp)
(require 'init-mackeys)
(require 'init-fonts)

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
	    (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-elpa)
(require-package 'diminish)

(require 'init-misc)
(require 'init-evil)

(when ixnij/meow-enable-p
  (require 'init-meow))

(when (maybe-require-package 'ace-window)
  (global-set-key (kbd "M-o") 'ace-window))

(require 'init-exec-path)
(require 'init-minibuffer)
(require 'init-company)
(require 'init-org)

(require 'init-lisp)
(require 'init-md)

(require 'init-edit)
(require 'init-lsp)
(require 'init-git)
(require 'init-look)
(require 'init-dired)
(require 'init-ibuffer)
(require 'init-session)
(require 'init-undo-tree)

(require 'init-zh-utils)

(require 'init-site-lisp)

(when system-darwin-p
  (when (maybe-require-package 'ns-auto-titlebar)
    (ns-auto-titlebar-mode)))

(add-hook 'after-init-hook
	  (lambda ()
	    (require 'server)
	    (unless (server-running-p)
	      (server-start))))

(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
