;;; init-evil.el --- For evil-mode -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  :bind (([remap evil-quit] . kill-this-buffer)
	 :map evil-motion-state-map
	 ("f" . evil-avy-goto-char-in-line)
	 :map evil-normal-state-map
	 ("s" . evil-avy-goto-char-timer))
  :hook
  (after-init . evil-mode)
  :custom
  (evil-undo-system 'undo-redo))

(use-package evil-collection
  :ensure t
  :hook (evil-mode . evil-collection-init)
  :custom
  (evil-collection-calendar-want-org-bindings t)
  (evil-collection-outline-bind-tab-p nil)
  (evil-collection-setup-minibuffer nil)
  (evil-collection-setup-debugger-keys nil))

(provide 'init-evil)
;;; init-evil.el ends here
