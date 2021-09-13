;;; init-look.el -- For appearance config  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'doom-themes)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
;;  (load-theme 'doom-ayu-mirage t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config))

(if (and system-darwin-p (display-graphic-p))
  (if (string-equal ns-system-appearance "dark")
      (load-theme 'doom-one t)
    (load-theme 'doom-one-light t))
  (load-theme 'doom-city-lights t))

(provide 'init-look)
;;; Local Variables:
;;; coding: utf-8
;;; init-look.el ends here
