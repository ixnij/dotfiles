(when (maybe-require-package 'selectrum)
  (add-hook 'after-init-hook 'selectrum-mode)
  (when (maybe-require-package 'consult) ()))

(provide 'init-selectrum)
