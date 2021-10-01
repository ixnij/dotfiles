;;; init-site-lisp.el --- Settings for non-elpa packages.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'awesome-tab)
(awesome-tab-mode t)

(provide 'init-site-lisp)
;;; init-site-lisp.el ends here
