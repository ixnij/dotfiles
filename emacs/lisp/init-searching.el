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
    (add-hook 'after-init-hook 'marginalia-mode))
  (when (maybe-require-package 'consult)
    (global-set-key (kbd "C-s") 'consult-line)))

(when (maybe-require-package 'helpful)
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))

(provide 'init-searching)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-searching.el ends here
