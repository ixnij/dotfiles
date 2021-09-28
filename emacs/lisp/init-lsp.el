;;; init-lsp.el --- For language server protocl support.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'lsp-mode)
  (require 'lsp-mode)
  (add-hook 'c++-mode-hook #'lsp-deferred)
  (add-hook 'c-mode-hook #'lsp-deferred)
  (when (maybe-require-package 'lsp-ui)
    ())
  (when (maybe-require-package 'company-box)
    (require 'company-box)
    (add-hook 'company-mode-hook 'company-box-mode)))

(provide 'init-lsp)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-lsp.el ends here
