;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configurations.

;;; code:

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(setq custom-file
    (expand-file-name "custom.el" user-emacs-directory))
(require 'init-constants)
(require 'init-startup)
(require 'init-elpa)
(require 'init-key)
(require 'init-packages)
(require 'init-look)

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init.el ends here
