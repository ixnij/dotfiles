;;; init.el --- Bootstraps the full configuretion.  -*- lexical-binding: t; -*-

;;; Commentary:

;; This file is a bootstraper of full configuretion.

;;; Code:

(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "This Emacs is too old to use. -- You need to update to %s or higher." minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst system-darwin-p (eq system-type 'darwin))

(require 'init-utils)
(require 'init-native-comp)
(require 'init-mackeys)
(require 'init-fonts)

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
	    (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-elpa)
(require 'init-selectrum)
(require 'init-company)
(require 'init-lisp)
(require 'init-editing)
(require 'init-magit)
(require 'init-look)

(add-hook 'after-init-hook
	  (lambda ()
	    (require 'server)
	    (unless (server-running-p)
	      (server-start))))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
