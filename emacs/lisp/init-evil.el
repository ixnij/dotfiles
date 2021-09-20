;;; init-evil.el --- For evil-mode -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(when (maybe-require-package 'evil)
  (require 'evil)
  (evil-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
