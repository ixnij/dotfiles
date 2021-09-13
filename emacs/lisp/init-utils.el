;;; init-utils.el --- Miscellaneous.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(or system-darwin-p (menu-bar-mode -1))

(setq inhibit-startup-screen t)

(defalias 'list-buffers 'ibuffer) ; to make ibuffer default.

(setq visual-line-fringe-indicators '(left-bracket right-bracket))

(provide 'init-utils)
;;; Local Variables:
;;; coding: utf-8
;;; end:
;;; init-utils.el ends here
