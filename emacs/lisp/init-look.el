(when (maybe-require-package 'doom-themes)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-ayu-mirage t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config))

(provide 'init-look)
