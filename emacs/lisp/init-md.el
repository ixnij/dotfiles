;;; init-md.el --- For markdown.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'markdown-mode)
  (add-auto-mode 'markdown-mode "\\.md\\.html\\'") 
  (with-eval-after-load 'whitespace-cleanup-mode
    (add-to-list 'whitespace-cleanup-mode-ignore-modes 'markdown-mode)))

(provide 'init-md)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-md.el ends here
