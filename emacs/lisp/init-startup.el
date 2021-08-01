;;; init-startup.el -- Do some startup jobs. -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(require 'init-constants)
(require 'init-fn)

(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq gc-cons-threshold most-positive-fixnum)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq inhibit-startup-screen t)
(setq initial-scratch-message (show-user-login-info))

(progn (tool-bar-mode -1)
       (scroll-bar-mode -1))
(unless sys/darwinp
  (menu-bar-mode -1))

(if sys/darwinp
    (setq delete-by-moving-to-trash t))

(setq make-backup-files nil
      auto-save-default nil)

(provide 'init-startup)

;; Local Variables:
;; coding: utf-8
;; End:

;;; init-startup.el ends here
