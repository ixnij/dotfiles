;;; init.el --- Bootstraps the full configuretion.  -*- lexical-binding: t; -*-

;;; Commentary:

;; The `add-subdirs-to-load-path' was copied from manateelazycat.
;; @see line 136 ~ 141 at
;; https://manateelazycat.github.io/eaf/emacs/2020/05/10/eaf-community.html.

;;; Code:

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(defun add-subdirs-to-load-path (dir)
  "Recursive add DIR to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.emacs.d/site-lisp")
(setq read-process-output-max (* 1024 1024))
(set-language-environment "UTF-8")

;; package.el
(setq package-quickstart t)
(package-initialize) ;; do not forget it
(setq custom-file (locate-user-emacs-file "custom.el"))

;; native-comp
(when (and (fboundp 'native-comp-available-p) (native-comp-available-p))
  (setq native-comp-async-jobs-number 8))

(require 'init-elpa)

(use-package no-littering
  :ensure t
  :config
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)
  (setq auto-save-file-name-transforms
	`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  )
;(require 'init-org)
(use-package diminish
  :ensure t)

(use-package ns-auto-titlebar
  :when (eq system-type 'darwin)
  :ensure t
  :config
  (ns-auto-titlebar-mode))

(use-package emacs
  :ensure nil
  :when (eq system-type 'darwin)
  :bind
  (("M--" . text-scale-decrease)
   ("M-=" . text-scale-increase))
  :config
  (setq mac-option-modifier 'super
	mac-command-modifier 'meta))

;; editing
;;(require 'init-evil)
(require 'init-fonts)
(require 'init-meow)
(require 'init-edit)

(require 'init-minibuffer)

;; I'm using corfu now.
(require 'init-corfu)
;;(require 'init-tempel)

(require 'init-git)

;; misc
(require 'init-misc)

;; I don't know where I can put them.
(use-package haskell-mode
  :ensure t)

;; appearance
(require 'init-look)

;;(require 'init-fns)

(unless (display-graphic-p)
  (xterm-mouse-mode))

(progn ; personalize
  (let ((file (expand-file-name "private.el" user-emacs-directory)))
    (when (file-exists-p file)
      (load file))))

(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
