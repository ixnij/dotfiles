;;; init-cn.el --- Settings for China locale -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(use-package pyim
  :init
  (use-package posframe :defer t)
  :custom
  (default-input-method "pyim")
  (pyim-default-scheme 'quanpin)
  (pyim-page-tooltip 'posframe)
  (pyim-page-length 9)
  :config
  (use-package pyim-basedict
    :after pyim
    :config (pyim-basedict-enable))
  (pyim-isearch-mode 1)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-isearch-mode
                  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  :bind
  ("M-j" . pyim-convert-string-at-point))

(provide 'init-cn)

;;; Local Variables:
;;; coding: utf-8
;;; End:

;;; init-cn.el ends here
