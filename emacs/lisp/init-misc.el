;;; init-misc.el --- Miscellaneous and built-in.  -*- lexical-binding: t; -*-

;;; Commentary:
;; The `add-auto-mode' is from purcell.
;; This file also config for some built-in packages.
;; `follow-mode' is awesome.
;;; Code:

(or (and system-darwin-p (display-graphic-p)) (menu-bar-mode -1))

(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)

;; to make ibuffer default.
(defalias 'list-buffers 'ibuffer)

(setq visual-line-fringe-indicators '(left-bracket right-bracket))

;; There is some problems with gui.
(setq-default
 window-resize-pixelwise t
 frame-resize-pixelwise t)

;; Handier way to add modes to auto-mode-alist
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;; Make winner mode load after init.
(add-hook 'after-init-hook 'winner-mode)

;; Remeber curser localtion
(add-hook 'after-init-hook 'save-place-mode)

(add-hook 'after-init-hook 'global-hl-line-mode)

(global-so-long-mode t)

(add-hook 'after-init-hook 'global-auto-revert-mode)

(savehist-mode t)

(recentf-mode t)

(diminish 'hs-minor-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)

(require-package 'restart-emacs)

(provide 'init-misc)
;;; Local Variables:
;;; coding: utf-8
;;; end:
;;; init-misc.el ends here
