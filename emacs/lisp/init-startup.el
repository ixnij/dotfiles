;;; init-startup.el -- Do some startup jobs. -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(require 'init-constants)

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

(if (display-graphic-p)
    "There's some promlems in daemon mode. 'cause the `display-graphic-p' can't judge when
emacs run as daemon. will fix. Antoher function about it: `daemonp'.
 One last thing: when run in daemon mode, emacsclient as tui mode can not display the color
rightly."
  (progn (tool-bar-mode -1)
	 (scroll-bar-mode -1)))

(if (not sys/darwinp)
    (menu-bar-mode -1))

(provide 'init-startup)

;; Local Variables:
;; coding: utf-8
;; End:

;;; init-startup.el ends here
