;;; init-startup.el -- Do some startup jobs. -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(require 'init-constants)
(require 'use-package)

(use-package emacs
  :ensure nil
  :config (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (setq gc-cons-threshold most-positive-fixnum))

;; (use-package emacs
;; :ensure nil
;; :config (if (display-graphic-p)
;; (progn (tool-bar-mode -1)
;; (scroll-bar-mode -1)))
;; (menu-bar-mode -1)
(setq inhibit-startup-screen t)

(progn (tool-bar-mode -1)
       (scroll-bar-mode -1))
(unless sys/darwinp
  (menu-bar-mode -1))

(provide 'init-startup)

;; Local Variables:
;; coding: utf-8
;; End:

;;; init-startup.el ends here
