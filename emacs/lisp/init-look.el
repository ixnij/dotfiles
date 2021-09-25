;;; init-look.el -- For appearance config  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(setq ns-system-appearance "dark")

(when (maybe-require-package 'doom-themes)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config))

(if (and system-darwin-p (display-graphic-p))
    (if (string-equal ns-system-appearance "dark")
        (load-theme 'doom-opera t)
      (load-theme 'doom-one-light t))
  (load-theme 'doom-xcode t))

(when (maybe-require-package 'doom-modeline)
  (require 'doom-modeline)
  (add-hook 'after-init-hook #'doom-modeline-mode)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-unicode-fallback t)
  (setq doom-modeline-indent-info t))

(provide 'init-look)
;;; Local Variables:
;;; coding: utf-8
;;; init-look.el ends here
