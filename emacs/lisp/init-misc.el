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
    " - Emacs by your side!\n"
    ";; Never forget the support of your family!\n"
    (format (concat
	     ";; Emacs takes %s to init.\n"
	     ";; Emacs version: %s\n"
	     ";; Emacs package quantity: %s")
	    (emacs-init-time)
	    emacs-version
	    (length package-alist))))
  (setq-default
   window-resize-pixelwise t
   frame-resize-pixelwise t)
  (setq inhibit-startup-screen t)
  (fset 'yes-or-no-p 'y-or-n-p) ;; emacs 28 has `use-short-answers'
  :bind
  ([remap list-buffers] . ibuffer))

;; Copied from yuanqian
(setq ibuffer-saved-filter-groups
      (quote (("Default"
	       ("Dired" (mode . dired-mode))
	       ("Org" (name . "^.*org$"))
	       ("Magit" (mode . magit-mode))
	       ("web" (or (mode . web-mode) (mode . js2-mode)))
	       ("Shell" (or (mode . eshell-mode) (mode . shell-mode)))
	       ("Programming" (or (mode . haskell-mode)
				  (mode . c-or-c++-mode)
				  (mode . shell-script-mode)))
	       ("Emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	       ))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (ibuffer-switch-to-saved-filter-groups "default")))
;; End

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

(use-package repeat
  :ensure nil
  :hook (after-init . repeat-mode)
  :custom
  (repeat-exit-key (kbd "RET")))

(use-package whitespace-cleanup-mode
  :ensure t
  :diminish
  :hook (after-init . global-whitespace-cleanup-mode))

(use-package so-long
  :ensure nil
  :config (global-so-long-mode 1))

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

(use-package winner-mode
  :ensure nil
  :hook (after-init . winner-mode))

(use-package restart-emacs :defer t)

;; MacOS specific
(use-package exec-path-from-shell
  :when (eq system-type 'darwin)
  :hook (after-init . exec-path-from-shell-initialize))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package ace-window
  :defer t
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

;;(use-package avy
;;  :defer t
;;  ;; integrate with isearch and others
;;  ;; C-' to select isearch-candidate with avy
;;  :hook (after-init . avy-setup-default)
;;  :bind (("M-g M-l" . avy-goto-line)
;;	 ("M-g M-j" . avy-goto-char-timer))
;;  :custom
;;  (avy-background t)
;;  (avy-all-windows nil)
;;  (avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?u ?i ?o ?p))
;;  ;; overlay is used during isearch, `pre' style makes avy keys evident.
;;  (avy-styles-alist '((avy-isearch . pre))))

;; (use-package avy
;; :ensure t
;; :hook (after-init . avy-setup-default)
  ;; :bind ("M-l" . avy-goto-line))

;; (use-package ace-pinyin
  ;; :ensure t
  ;; :config
  ;; (ace-pinyin-global-mode +1))

(use-package gcmh
  :ensure t
  :diminish
  :hook (after-init . gcmh-mode)
  :custom
  (gcmh-idle-delay 10)
  (gcmh-high-cons-threshold #x6400000)) ;; 100 MB

;;(use-package go-translate
;;  :ensure t
;;  :defer t
;;  :custom
;;  (gts-translate-list '(("en" "zh") ("fr" "zh"))))

;;(use-package rime
  ;;:ensure t
  ;;:defer t
  ;;:custom
  ;;(rime-librime-root "~/.emacs.d/librime/dist")
  ;;(rime-emacs-module-header-root "~/.emacs.d/librime")
  ;;(default-input-method "rime")
  ;;:config
  ;;(setq rime-show-candidate 'posframe)
  ;;(setq rime-posframe-properties
	;;(list :font "Monaco"
	      ;;:internal-border-width 10)))

(use-package emacs
  :ensure nil
  :init
  (setq desktop-save 't)
  (setq desktop-dirname (concat (getenv "HOME") "/.emacs.d/"))
  (pixel-scroll-precision-mode)
  ;; very nice 👍
  (desktop-save-mode 1)
  )

;;(use-package workgroups2
  ;;:ensure t
  ;;:hook
  ;;(after-init . workgroups-mode)
  ;;:config
  ;;(setq wg-session-file "~/.emacs.d/var/workgroups.el"))

(use-package markdown-mode
  :ensure t
  :defer t)

;;(use-package easy-hugo
;;  :ensure t
;;  :defer t
;;  :config
;;  (setq easy-hugo-basedir
;;	"")
;;  (setq easy-hugo-postdir "content/posts"))

(use-package emacs
  :bind
  (("M--" . text-scale-decrease)
   ("M-=" . text-scale-increase))
  :config
  (global-visual-line-mode 1)
  (diminish 'visual-line-mode))

(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode))

(setq word-wrap-by-category t) ;; it solves a chinese users' problem
;; or cjk?

;; (use-package telega
  ;; :ensure t
  ;; :custom
;; (telega-server-libs-prefix "/opt/homebrew/Cellar/tdlib/1.8.0"))

;;(use-package awesome-tray
  ;;:ensure nil
  ;;:after modus-themes
  ;;:config
;;(awesome-tray-mode 1))

(use-package helpful
  :ensure t
  :bind (([remap describe-function] . helpful-callable)
	 ([remap describe-command] . helpful-command)
	 ([remap describe-variable] . helpful-variable)
	 ([remap describe-key] . helpful-key)
	 ([remap describe-symbol] . helpful-symbol)))

(provide 'init-misc)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; end:
;;; init-misc.el ends here
