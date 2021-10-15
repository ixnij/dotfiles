;;; init-minibuffer.el --- Settings for minibuffer.  -*- lexical-binding: t; -*-

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

  (require-package 'savehist)
  (add-hook 'after-init-hook #'savehist-mode)

;;  (require 'vertico-directory)
;;  (define-key vertico-map "RET" #'vertico-directory-enter)
;;  (define-key vertico-map "DEL" #'vertico-directory-delete-char)
;;  (define-key vertico-map "M-DEL" #'vertico-directory-delete-word)

  (when (maybe-require-package 'marginalia)
    (add-hook 'after-init-hook 'marginalia-mode))
  (when (maybe-require-package 'consult)
    (global-set-key (kbd "C-s") 'consult-line)))



(when (maybe-require-package 'embark)
  (require 'embark)
  (global-set-key (kbd "C-.") #'embark-act)
  (global-set-key (kbd "C-;") #'embark-dwim)
  (global-set-key (kbd "C-h B") #'embark-bindings)
  (setq prefix-help-command #'embark-prefix-help-command)

  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none))))
  (when (maybe-require-package 'embark-consult)
    (require 'embark-consult)
    (add-hook 'embark-collect-mode #'consult-preview-at-point-mode)))



(when (maybe-require-package 'helpful)
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))

(provide 'init-minibuffer)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-minibuffer.el ends here
