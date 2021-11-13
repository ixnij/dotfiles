;;; init.el --- Bootstraps the full configuretion.  -*- lexical-binding: t; -*-

;;; Commentary:

;; This file bootstraps full configuretion.

;;; Code:
(let
    ((minver "25.1"))
  (when
      (version< emacs-version minver)
    (error "This Emacs is too old to use.-- You need to update to %s or higher" minver)))
(when
    (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(when
    (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defconst system-darwin-p
  (eq system-type 'darwin))
(defconst system-linux-p
  (eq system-type 'gnu/linux))

(defvar ixnij/vertico-use-posframe-p nil)

(require 'init-native-comp)
(require 'init-mackeys)
(require 'init-fonts)
(let
    ((normal-gc-cons-threshold
      (* 20 1024 1024))
     (init-gc-cons-threshold
      (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
	    (lambda
	      ()
	      (setq gc-cons-threshold normal-gc-cons-threshold))))
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(require 'init-site-lisp)
(require 'init-elpa)
(package-initialize)
(require-package 'diminish)
(require-package 'posframe)
(require 'init-misc)
(require 'init-evil)
(when
    (maybe-require-package 'ace-window)
  (global-set-key
   (kbd "M-o")
   #'ace-window))
(require 'init-exec-path)
(require 'init-minibuffer)
(require 'init-company)
(require 'init-org)
(require 'init-lisp)
(require 'init-md)
(require 'init-haskell)
(require 'init-nix)
(require 'init-edit)
(require 'init-lsp)
(require 'init-git)
(require 'init-look)
(require 'init-dired)
(require 'init-ibuffer)
(require 'init-session)
(require 'init-undo-tree)
(require 'init-zh-utils)

(when
    (require 'eaf nil t)
  (require 'eaf-airshare)
  (require 'eaf-browser)
  (require 'eaf-camera)
  (require 'eaf-demo)
  (require 'eaf-file-browser)
  (require 'eaf-file-manager)
  (require 'eaf-file-sender)
  (require 'eaf-image-viewer)
  (require 'eaf-jupyter)
  (require 'eaf-markdown-previewer)
  ;; (require 'eaf-mermaid)
  (require 'eaf-mindmap)
  (require 'eaf-music-player)
  (require 'eaf-org-previewer)
  (require 'eaf-pdf-viewer)
  (require 'eaf-system-monitor)
  (require 'eaf-terminal)
  (require 'eaf-video-player)
  (require 'eaf-vue-demo)
  (require 'eaf-netease-cloud-music)
  (require 'eaf-rss-reader))
(when system-darwin-p
  (when
      (maybe-require-package 'ns-auto-titlebar)
    (ns-auto-titlebar-mode)))
(add-hook 'after-init-hook
	  (lambda
	    ()
	    (require 'server)
	    (unless
		(server-running-p)
	      (server-start))))
(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
