;;; init-look.el -- For appearance config  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'doom-themes)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config))

;; For modeline.
(column-number-mode 1)

(defvar current-theme 'doom-one
  "Current theme.")

;; (require-package 'modus-themes)
(require-package 'nano-theme)
(if (display-graphic-p)
    (load-theme 'doom-one-light t)
  (load-theme 'doom-one t))


(defvar ixnij/themes
  '((light . doom-one-light)
    (dark . doom-one))
  "The themes I'm using.")

(defun ixnij/switch-theme ()
  (interactive)
  (let
      ((light-theme (cdr (assoc 'light ixnij/themes)))
       (dark-theme (cdr (assoc 'dark ixnij/themes))))
    (if (equal current-theme dark-theme)
	(progn 
	  (load-theme light-theme t)
	  (disable-theme current-theme)
	  (setq current-theme light-theme))
      (progn
	(load-theme dark-theme t)
	(disable-theme current-theme)
	(setq current-theme dark-theme)))))

(provide 'init-look)
;;; Local Variables:
;;; coding: utf-8
;;; init-look.el ends here
