;;; init-undo-tree.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-visualizer-diff t)
  (undo-tree-visualizer-timestamps t))


(provide 'init-undotree)
;;; init-undotree.el ends here
