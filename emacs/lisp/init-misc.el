;;; init-misc.el --- Miscellaneous and built-in.  -*- lexical-binding: t; -*-

;;; Commentary:

;; Code:

(use-package emacs
  :config
  (setq-default initial-scratch-message
		(concat ";; Love the World, " user-login-name " - Emacs by your side!\n;; Never forget the support of your family!\n\n"))
  (setq-default
   window-resize-pixelwise t
   frame-resize-pixelwise t)
  (setq inhibit-startup-screen t)
  (fset 'yes-or-no-p 'y-or-n-p) ;; emacs 28 has `use-short-answers' 
  (defalias 'list-buffers 'ibuffer)
  :hook
  (after-init-hook . global-auto-revert-mode)
  (after-init-hook . save-place-mode)
  (after-init-hook . winner-mode)
  (after-init-hook . global-hi-line-mode)
  (after-init-hook . global-so-long-mode))

(use-package restart-emacs)

(provide 'init-misc)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; end:
;;; init-misc.el ends here
