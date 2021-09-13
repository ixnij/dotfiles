;;; init-searching.el --- Set up searching and minibuffer.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'vertico)
  (add-hook 'after-init-hook 'vertico-mode))

(provide 'init-searching)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-searching.el ends here
