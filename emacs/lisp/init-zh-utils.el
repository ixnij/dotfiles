;;; init-zh-utils.el --- Chinese utils.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'cnfonts)
  (require 'cnfonts)
  (cnfonts-enable))

(when (maybe-require-package 'pyim)
  (require 'pyim)
  (require-package 'pyim-basedict)
  (require 'pyim-basedict)
  (pyim-basedict-enable)
  (setq default-input-method "pyim")
  (pyim-default-scheme 'quanpin)
  (pyim-isearch-mode 1)
  (if (posframe-workable-p)
      (setq pyim-page-tooltip 'posframe)
    (setq pyim-page-tooltip 'popup))
  (setq pyim-page-length 5))

(provide 'init-zh-utils)
;;; init-zh-utils.el ends here
