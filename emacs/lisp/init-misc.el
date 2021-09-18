;;; init-misc.el --- Miscellaneous.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(or (and system-darwin-p (display-graphic-p)) (menu-bar-mode -1))

(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)

;; to make ibuffer default.
(defalias 'list-buffers 'ibuffer)

(setq visual-line-fringe-indicators '(left-bracket right-bracket))

;; There is some problems with gui.
(setq-default
 window-resize-pixelwise t
 frame-resize-pixelwise t)

(provide 'init-misc)
;;; Local Variables:
;;; coding: utf-8
;;; end:
;;; init-misc.el ends here
