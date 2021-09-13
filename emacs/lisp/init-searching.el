 ;;; init-searching.el --- Setup searching and minibuffer.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'vertico)
  (add-hook 'after-init-hook 'vertico-mode)

  (require-package 'orderless)
  (with-eval-after-load 'vertico
    (require 'orderless))

  (defun ixnij/use-orderless-in-minibuffer ()
    (setq-local completion-styles '(substring orderless)))
  (add-hook 'minibuffer-setup-hook 'ixnij/use-orderless-in-minibuffer)

  (when (maybe-require-package 'marginalia)
  (add-hook 'after-init-hook 'marginalia-mode)))

(provide 'init-searching)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-searching.el ends here
