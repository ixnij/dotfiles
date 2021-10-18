;;; init-undo-tree.el --- For undo-tree.

;;; Commentary:

;;; Code:

(when (maybe-require-package 'undo-tree)
  (global-undo-tree-mode 1))
(diminish 'undo-tree-mode)

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
