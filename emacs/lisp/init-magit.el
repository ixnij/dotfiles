;;; init-magit-el --- -*- lexial-binding: t -*-

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package magit
  :if (executable-find "git")
  :bind
  (("C-x g" . magit-status)
   (:map magit-status-mode-map
         ("M-RET" . magit-diff-visit-file-other-window)))
  :config
  (defun magit-log-follow-current-file ()
    "A wrapper around `magit-log-buffer-file' with `--follow' argument."
    (interactive)
    (magit-log-buffer-file t)))

(provide 'init-magit)
;;; Local Variables:
;;; coding: utf-8
;;; End:

;;; init-magit.el ends here
