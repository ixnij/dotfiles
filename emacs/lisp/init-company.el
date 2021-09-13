;;; init-company.el --- Settings for company.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; TODO:

;; Either:
;; [] company-box
;; [] company-quickhelp

;;; Code:

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (diminish 'company-mode)
    (setq-default company-dabbrev-other-buffers 'all
		  company-tooltip-align-annotations t))
  (global-set-key (kbd "M-C-/") 'company-complete)
  (setq company-minimum-prefix-length 1))

(provide 'init-company)
;;; Local Variable:
;;; coding: utf-8
;;; End:
;;; init-company.el ends here
