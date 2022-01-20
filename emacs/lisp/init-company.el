;;; init-company.el --- Settings for company.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package company
  :hook
  (after-init . global-company-mode)
  :custom
  (company-idle-delay 0)
  ;; Easy navigation to candidates with M-<n>
  (company-show-quick-access t)
  (company-require-match nil)
  (company-minimum-prefix-length 1)
  (company-tooltip-width-grow-only t)
  (company-tooltip-align-annotations t)
  ;; complete `abbrev' only in current buffer and make dabbrev case-sensitive
  ;;(company-dabbrev-other-buffers nil)
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-downcase nil)
  ;; make dabbrev-code case-sensitive
  (company-dabbrev-code-ignore-case nil)
  (company-dabbrev-code-everywhere t)
  ;; call `tempo-expand-if-complete' after completion
  (company-tempo-expand t)
  ;; Stop annoying me
  (company-etags-use-main-table-list nil)
  ;; No icons
  ;;(company-format-margin-function nil))
  )

(provide 'init-company)
;;; Local Variable:
;;; coding: utf-8
;;; End:
;;; init-company.el ends here
