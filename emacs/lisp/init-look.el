;; init-look.el -- Set the graphic interface. -*- lexical-binding:t -*-
;;; Commentary:
;;; init-look.el

;;; Code:

(require 'use-package)

;; (use-package atom-one-dark-theme
;; :init (load-theme 'atom-one-dark t))

(use-package doom-themes
  :custom-face
  (cursor ((t (:background "BlanchedAlmond"))))
  :config
  ;; flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  :init (load-theme 'doom-one t))

;; (use-package flatland-theme
;;  :init (load-theme 'flatland))
  
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
;; End:

;;; init-look.el ends here
