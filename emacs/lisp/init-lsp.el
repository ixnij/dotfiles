;;; init-lsp.el --- For language server protocl support.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'eglot)
  (require 'eglot)
  (add-to-list 'eglot-server-programs '(c-or-c++-mode  . ("/Library/Developer/CommandLineTools/usr/bin/clangd" "--background-index")))
  (add-hook 'c-or-c++-mode-hook 'eglot-ensure))

(provide 'init-lsp)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-lsp.el ends here
