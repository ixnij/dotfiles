(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(or system-darwin-p (menu-bar-mode -1))

(setq inhibit-startup-screen t)

(provide 'init-utils)
