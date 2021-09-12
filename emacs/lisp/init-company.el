(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 1))

(provide 'init-company)
