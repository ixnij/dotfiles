;;; init-lsp.el --- For language server protocl support.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'eglot)
  (require 'eglot)
  (add-to-list 'eglot-server-programs '(c++-mode  . ("/Library/Developer/CommandLineTools/usr/bin/clangd" "--background-index")))
  (add-to-list 'eglot-server-programs '(c-mode  . ("/Library/Developer/CommandLineTools/usr/bin/clangd" "--background-index")))
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'c-mode-hook 'eglot-ensure))

(provide 'init-lsp)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-lsp.el ends here
