(use-package eglot
  :ensure t
  )

(use-package eldoc-box
  :ensure t
  :config
  (add-hook 'eglot--managed-mode-hook #'eldoc-box-hover-mode t))

(use-package consult-eglot
  :ensure t
  )

(provide (quote init-eglot))
