(use-package tree-sitter
  :ensure t
  :hook (tree-sitter-mode-on-hook . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t)

(provide 'init-tree-sitter)
