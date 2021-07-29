;;; init-edit.el --- Initialize editing configurations.	-*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Automatic parenthesis pairing.
(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode)
  :init (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))

(use-package emacs
  :ensure nil
  :config
  (setq display-line-numbers-type 't) ;; or visual, relative
  (global-display-line-numbers-mode t))

(use-package highlight-indent-guides
  :diminish
  :hook (prog-mode . highlight-indent-guides-mode)
  :init (setq highlight-indent-guides-method 'character
              highlight-indent-guides-responsive 'top
              highlight-indent-guides-suppress-auto-error t))

(use-package rainbow-delimiters
  :diminish
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-parentheses
  :diminish
  :hook (prog-mode . highlight-parentheses-mode))

(provide 'init-edit)

;;; Local Variables:
;;; coding: utf-8
;;; no-byte-compile: t
;;; End:

;;; init-edit.el ends here
