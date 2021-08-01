;;; init.el --- Load the full configuration. -*- lexial-binding: t -*-
;;; Commentary:

;; This file bootstraps the configurations.

;;; code:

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(require 'init-startup)
(require 'init-fn)
(require 'init-constants)
(require 'init-elpa) ; using use-package
(require 'init-look)
(require 'init-key)
(require 'init-packages)
(require 'init-edit)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-ivy)
(require 'init-magit)
(require 'init-undotree)
(require 'init-flycheck)
(require 'init-cn)
(require 'init-lsp)
(require 'init-ap)
(require 'init-treemacs)

(provide 'init)
;; Local Variables:
;; coding: utf-8
;; End:

;;; init.el ends here
