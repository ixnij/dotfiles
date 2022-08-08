;;; init-misc.el --- Miscellaneous and built-in.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

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

(use-package restart-emacs :ensure t :defer t)

;; MacOS specific
(use-package exec-path-from-shell
  :when (eq system-type 'darwin)
  :hook (after-init . exec-path-from-shell-initialize))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;;(use-package ace-window
  ;;:defer t
  ;;:bind ("M-o" . ace-window))

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
  :ensure nil
  :init
  (setq desktop-save 't)
  ;; very nice 👍
  (desktop-save-mode 1)
  :bind
  (("M--" . text-scale-decrease)
   ("M-=" . text-scale-increase)
   ("M-o" . other-window))
  :config
  (global-visual-line-mode 1)
  (diminish 'visual-line-mode)
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
	     ";; Emacs package quantity: %s\n")
	     (emacs-init-time)
	     emacs-version
	     (length package-alist)
	     )))
   (setq-default
    window-resize-pixelwise t
    frame-resize-pixelwise t)
   (setq inhibit-startup-screen t)
   ;;(fset 'yes-or-no-p 'y-or-n-p) ;; emacs 28 has `use-short-answers'
   (when (fboundp 'pixel-scroll-precision-mode)
     (pixel-scroll-precision-mode))

   (dowEver "28.1"
	    (setq word-wrap-by-category t)) ;; it solves a chinese users' problems
   (setq use-short-answers t)
   :bind
   ([remap list-buffers] . ibuffer))

(use-package all-the-icons-ibuffer
  :ensure t
  :when (display-graphic-p)
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package all-the-icons-dired
  :ensure t
  :when (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package xref
  :ensure nil
  :when (executable-find "rg")
  :custom
  (xref-search-program 'ripgrep))

(use-package helpful
  :ensure t
  :defer t
  :init
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))

(provide 'init-misc)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-misc.el ends here
