;;; init-git.el --- For git.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package magit
  :defer t)

;; NOTE: `diff-hl' depends on `vc'
(use-package vc
  :ensure nil
  :custom
  (vc-follow-symlinks t)
  (vc-allow-async-revert t)
  (vc-handled-backends '(Git)))

;; Highlight uncommitted changes using VC
(use-package diff-hl
  :hook ((after-init         . global-diff-hl-mode)
	 (dired-mode         . diff-hl-dired-mode-unless-remote)
	 (magit-pre-refresh  . diff-hl-magit-pre-refresh)
	 (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  ;; When Emacs runs in terminal, show the indicators in margin instead.
  (unless (display-graphic-p)
    (diff-hl-margin-mode)))

(provide 'init-git)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-git.el ends here
