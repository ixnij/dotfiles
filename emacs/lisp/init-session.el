;;; init-session.el --- For sessions  -*- lexical-binding: t; -*-

;;; Commentary:

;;; TODO:

;; [] replace built-in desktop with presp.

;;; Code:

(require 'desktop)
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600
      desktop-file-modtime (file-attribute-modification-time
			    (file-attributes (desktop-full-file-name)))
      desktop-save t
      desktop-lazy-verbose nil
      desktop-restore-eager t)
(desktop-save-mode t)

(provide 'init-session)
;;; init-session.el ends here
