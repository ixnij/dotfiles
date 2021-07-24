;;; package --- init.el
;;; Commentary:
;;; the initiaze file.

;;; code:

(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file
    (expand-file-name "custom.el" user-emacs-directory))

(require 'init-constants)
(require 'init-startup)
(require 'init-elpa)
(require 'init-key)
(require 'init-packages)
(require 'init-look)

;;; init.el ends here
