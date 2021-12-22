;;; init-misc.el --- Miscellaneous and built-in.  -*- lexical-binding: t; -*-

;;; Commentary:

;; Code:

(use-package emacs
  :ensure nil
  :config
  (setq-default
   initial-scratch-message
   (concat
    ";; Love the World, "
    user-login-name
    " - Emacs by your side!\n;; Never forget the support of your family!\n\n"))
  (setq-default
   window-resize-pixelwise t
   frame-resize-pixelwise t)
  (setq inhibit-startup-screen t)
  (fset 'yes-or-no-p 'y-or-n-p) ;; emacs 28 has `use-short-answers'
  :bind
  ([remap list-buffers] . ibuffer))

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

(use-package repeat
  :ensure nil
  :hook (after-init . repeat-mode)
  :custom
  (repeat-exit-key (kbd "RET")))

(use-package emacs
  :ensure nil
  :hook
  (after-init-hook . global-whitespace-cleanup-mode))

(use-package so-long
  :ensure nil
  :config (global-so-long-mode 1))

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))
(use-package winner-mode
  :ensure nil
  :hook (after-init . winner-mode))

(use-package restart-emacs)

;; MacOS specific
(use-package exec-path-from-shell
  :when (eq system-type 'darwin)
  :hook (after-init . exec-path-from-shell-initialize))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package ace-window
  :bind ("M-o" . ace-window))

(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-filename-handlers '(abbreviate-file-name))
  (recentf-exclude `("/ssh:"
		     "/TAGS\\'"
		     "COMMIT_EDITMSG\\'")))

;; mode line
(use-package simple
  :ensure nil
  :hook (after-init . (lambda ()
			(line-number-mode)
			(column-number-mode)
			(size-indication-mode))))
(use-package avy
  ;; integrate with isearch and others
  ;; C-' to select isearch-candidate with avy
  :hook (after-init . avy-setup-default)
  :bind (("M-g M-l" . avy-goto-line)
         ("M-g M-j" . avy-goto-char-timer))
  :custom
  (avy-background t)
  (avy-all-windows nil)
  (avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?u ?i ?o ?p))
  ;; overlay is used during isearch, `pre' style makes avy keys evident.
  (avy-styles-alist '((avy-isearch . pre))))

(provide 'init-misc)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; end:
;;; init-misc.el ends here
