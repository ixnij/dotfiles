;;; init-lisp.el --- For prorgamming in Lisp.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'eros)
  (add-hook 'elisp-mode 'eros-mode))

(provide 'init-lisp)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-lisp.el ends here
