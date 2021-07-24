;;; init-startup.el -- do some startup jobs. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq gc-cons-threshold most-positive-fixnum)

(if (display-graphic-p)
 (progn (tool-bar-mode -1)
  (scroll-bar-mode -1)))
(menu-bar-mode -1)

(setq inhibit-startup-screen t)

(provide 'init-startup)

;; Local Variables:
;; coding: utf-8
;; End:

;;; init-startup.el ends here
