(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (diminish 'company-mode)
    (setq-default company-dabbrev-other-buffers 'all
		  company-tooltip-align-annotations t))
  (global-set-key (kbd "M-C-/") 'company-complete)
  (when (maybe-require-package 'company-quickhelp)
    (add-hook 'after-init-hook 'company-quickhelp-mode)))

(provide 'init-company)
