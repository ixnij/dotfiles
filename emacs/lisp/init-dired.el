;;; init-dired.el --- For dired.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))

(when (maybe-require-package 'diredfl)
  (with-eval-after-load 'dired
    (diredfl-global-mode)
    (require 'dired-x)))

(provide 'init-dired)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-dired.el ends here
