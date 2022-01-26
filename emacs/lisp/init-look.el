;;; init-look.el -- For appearance config  -*- lexical-binding: t; -*-

;;; Commentary:

;; Legacy code

;; (use-package modus-themes
;;   :config
;;   (modus-themes-load-vivendi))
;;
;; (defun ixnij/switch-theme ()
;;   (interactive)
;;   (let
;;       ((light-theme (cdr (assoc 'light ixnij/themes)))
;;        (dark-theme (cdr (assoc 'dark ixnij/themes))))
;;     (if (equal current-theme dark-theme)
;; 	(progn
;; 	  (disable-theme current-theme)
;; 	  (load-theme light-theme t)
;; 	  (setq current-theme light-theme))
;;       (progn
;; 	(disable-theme current-theme)
;; 	(load-theme dark-theme t)
;; 	(setq current-theme dark-theme)))))

;; (defvar ixnij/themes
;;   '((light . modus-operandi)
;;     (dark . modus-vivendi))
;;   "The themes I'm using.")
;;
;; (defvar current-theme (cdr (assoc 'light ixnij/themes))
;;   "Current theme.")

;;; Code:

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-oceanic-next t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(provide 'init-look)
;;; Local Variables:
;;; coding: utf-8
;;; init-look.el ends here
