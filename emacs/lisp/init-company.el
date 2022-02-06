;;; init-company.el --- Settings for company.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package company
  :ensure t
  :hook
  (after-init . global-company-mode)
;  (global-company-mode . company-tng-configure-default)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1))

(provide 'init-company)
;;; Local Variable:
;;; coding: utf-8
;;; End:
;;; init-company.el ends here
