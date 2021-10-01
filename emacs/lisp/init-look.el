;;; init-look.el -- For appearance config  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'doom-themes)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config))

(require-package 'modus-themes)
(require-package 'doom-themes)

(defvar current-theme 'modus-vivendi
  "Current theme.")

(defvar ixnij/themes
  '((dark . modus-vivendi)
    (light . modus-operandi))
  "The themes I'm using.")

(defun ixnij/switch-theme ()
  (interactive)
  (let
      ((light-theme (cdr (assoc 'light ixnij/themes)))
       (dark-theme (cdr (assoc 'dark ixnij/themes))))
    (if (equal current-theme dark-theme)
	(progn 
	  (load-theme light-theme)
	  (setq current-theme light-theme))
      (progn
	(load-theme dark-theme)
	(setq current-theme dark-theme)))))

(provide 'init-look)
;;; Local Variables:
;;; coding: utf-8
;;; init-look.el ends here
