;;; init-lsp.el --- Language server protocol settings

;;; Commentary:

;; Copy from cabins' cofiguretion file. (not all)

;;; Code:

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((c++-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-intergration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package which-key
  :config (which-key-mode))

(use-package dap-mode)

(provide 'init-lsp)

;;; Local Variables:
;;; coding: utf-8
;;; no-byte-compile: t
;;; End:

;;; init-lsp.el ends here
