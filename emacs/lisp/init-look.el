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



;; Since emacs 29, modus has became builtins
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

(add-hook 'after-init-hook #'ixnij/switch-theme)
(provide 'init-look)
;;; Local Variables:
;;; coding: utf-8
;;; init-look.el ends here
