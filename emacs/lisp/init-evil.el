;;; init-evil.el --- For evil-mode -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(when (maybe-require-package 'evil)
  (setq evil-want-keybinding nil)
  (require 'evil)
  (evil-mode 1)
  (when (require 'evil-collection nil t)
    (evil-collection-init)))

(provide 'init-evil)
;;; init-evil.el ends here
