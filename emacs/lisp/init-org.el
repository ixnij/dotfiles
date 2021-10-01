;;; init-org.el --- For org-mode settings.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)
    (haskell . t)))

(provide 'init-org)
;;; init-org.el ends here
