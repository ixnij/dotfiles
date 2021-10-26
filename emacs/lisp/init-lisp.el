;;; init-lisp.el --- For prorgamming in Lisp.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (ybe-require-package 'eros)
  (add-hook 'emacs-lisp-mode-hook 'eros-mode))

(provide 'init-lisp)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-lisp.el ends here
