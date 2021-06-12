;;; File name: init.el

(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file
    (expand-file-name "custom.el" user-emacs-directory))

(require 'init-constant)
(require 'init-startup)
(require 'init-elpa)
(require 'init-key)
(require 'init-packages)
(require 'init-look)
(require 'init-lsp)

;; End of init.el
