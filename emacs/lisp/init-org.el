;;; init-org.el --- For org-mode settings.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package org-mode
  :ensure nil
  :defer t
  :config
  (setq org-log-done t
	org-edit-timestamp-down-means-later t
	org-hide-emphasis-markers t
	org-catch-invisible-edits 'show
	org-export-coding-system 'utf-8
	org-fast-tag-selection-single-key 'expert
	org-html-validation-link nil
	org-startup-indented t
	org-export-kill-product-buffer-when-displayed t
	org-tags-column 80)
  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     `((emacs-lisp . t)
       ;; (gnuplot . t)
       (haskell . t)
       (dot . t)
       (C . t)
       (Cpp . t)
       (latex . t)
       (python . t)
       ))))

(use-package org-modern
  :ensure t
  :hook
  (org-mode . org-modern-mode))

(provide 'init-org)
;;; init-org.el ends here
