;; init-look.el -- Set the graphic interface.
;;; Commentary:
;;; init-look.el

;;; Code:

(use-package atom-one-dark-theme
  :init (load-theme 'atom-one-dark t))

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

;; end

(use-package emacs
  :ensure nil
  :config
  (setq display-line-numbers-type 't) ;; or visual, relative
  (global-display-line-numbers-mode t))

;; the following line must be put in the last of file

(provide 'init-look)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:

;;; init-look.el ends here
