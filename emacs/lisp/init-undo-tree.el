;;; init-undo-tree.el --- For undo-tree.

;;; Commentary:

;;; Code:

(when (maybe-require-package 'undo-tree)
  (global-undo-tree-mode 1))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
