;; init-look.el -- Set the graphic interface.
;;; Commentary:
;;; init-look.el

;;; Code:

(use-package atom-one-dark-theme
  :init (load-theme 'atom-one-dark t))

;; (use-package dracula-theme
;; :init (load-theme 'dracula))

;; (use-package monokai-theme
;;  :init (load-theme 'monokai))

;; (use-package solarized-theme
;;  :init (load-theme 'solarized-dark))

;; (use-package smart-mode-line
;; :init
;; (setq sml/no-confirm-load-theme t)
;; (setq sml/theme 'respectful)
;; (sml/setup))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

;; Font settings

(use-package emacs
  :ensure nil
  :if (display-graphic-p)
  :config (set-face-attribute 'default nil :font "Cascadia Code PL 13"))

(provide 'init-look)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:

;;; init-look.el ends here
