;;; init.el --- Load the full configuration. -*- lexial-binding: t -*-
;;; Commentary:

;; This file bootstraps the configurations.

;;; code:

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(setq custom-file
    (expand-file-name "custom.el" user-emacs-directory))

(require 'init-constants)
(require 'init-elpa)
(require 'init-startup)
(require 'init-key)
(require 'init-packages)
(require 'init-look)
(require 'init-edit)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-ivy)
(require 'init-lsp)

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:

;;; init.el ends here
