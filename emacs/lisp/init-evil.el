;;; init-evil.el --- For evil-mode -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'evil)
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  (require 'evil)
  (evil-mode 1)
  (when (maybe-require-package 'evil-collection)
    (when (require 'evil-collection nil t)
      (setq evil-collection-setup-minibuffer t)
      (setq evil-collection-setup-debugger-keys t)
      (setq evil-collection-calendar-want-org-bindings t)
      (evil-collection-init))))

(provide 'init-evil)
;;; init-evil.el ends here
