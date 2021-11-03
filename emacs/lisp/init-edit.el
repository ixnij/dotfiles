;;; init-edit.el --- Editing utils.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(when
    (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))

(maybe-require-package 'list-unicode-display)

(when
(maybe-require-package 'beacon)
(setq-default beacon-lighter " ^-^")
(setq-default beacon-size 50)
(add-hook 'after-init-hook 'beacon-mode))


;; It's very useful in lisp programming.
(when
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


;; clean the white space in code.
(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)
(with-eval-after-load 'whitespace-cleanup-mode
(diminish 'whitespace-cleanup-mode))


;; See http://ergoemacs.org/emacs/modernization_formfeed.html
;; the ^L: ascii 12
(when
(maybe-require-package 'page-break-lines)
(add-hook 'after-init-hook 'global-page-break-lines-mode)
(with-eval-after-load 'page-break-lines
(diminish 'page-break-lines-mode)))

(global-set-key
(kbd "RET")
'newline-and-indent)

(require-package 'rg)

(provide 'init-edit)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-edit.el ends here
