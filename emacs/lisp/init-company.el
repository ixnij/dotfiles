;;; init-company.el --- Settings for company.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (diminish 'company-mode)
    (setq-default company-dabbrev-other-buffers 'all
		  company-tooltip-align-annotations t))
  (global-set-key (kbd "M-C-/") 'company-complete)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  (when (maybe-require-package 'company-box)
    (require 'company-box)
    (add-hook 'company-mode-hook 'company-box-mode)
    (diminish 'company-box-mode)))

(provide 'init-company)
;;; Local Variable:
;;; coding: utf-8
;;; End:
;;; init-company.el ends here
