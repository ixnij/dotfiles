;;; init-look.el -- For appearance config  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package modus-themes
  :config
  (modus-themes-load-operandi))

(defvar ixnij/themes
  '((light . modus-operandi)
    (dark . modus-vivendi))
  "The themes I'm using.")

(defvar current-theme (cdr (assoc 'light ixnij/themes))
  "Current theme.")

(defun ixnij/switch-theme ()
  (interactive)
  (let
      ((light-theme (cdr (assoc 'light ixnij/themes)))
       (dark-theme (cdr (assoc 'dark ixnij/themes))))
    (if (equal current-theme dark-theme)
	(progn
	  (disable-theme current-theme)
	  (load-theme light-theme t)
	  (setq current-theme light-theme))
      (progn
	(disable-theme current-theme)
	(load-theme dark-theme t)
	(setq current-theme dark-theme)))))

(provide 'init-look)
;;; Local Variables:
;;; coding: utf-8
;;; init-look.el ends here
