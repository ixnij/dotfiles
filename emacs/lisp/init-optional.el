(use-package helpful
  :ensure t
  :defer t
  :init
  ;; Note that the built-in `describe-function' includes both functions
  ;; and macros. `helpful-function' is functions only, so we provide
  ;; `helpful-callable' as a drop-in replacement.
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key))
(use-package all-the-icons-ibuffer
  :ensure t
  :when (display-graphic-p)
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package all-the-icons-dired
  :ensure t
  :when (display-graphic-p)
  :hook (dired-mode . all-the-icons-dired-mode))

;;(use-package exec-path-from-shell
  ;;:when (eq system-type 'darwin)
;;:hook (after-init . exec-path-from-shell-initialize))

;;(use-package ace-window
  ;;:defer t
;;:bind ("M-o" . ace-window))

(use-package nndiscourse
  :ensure t
  :config
  ;; Applies to first-time Gnus users
  (custom-set-variables '(gnus-select-method
			  (quote (nndiscourse "emacs-china.org" (nndiscourse-scheme "https"))))))

(provide (quote
	  init-optional))
