;;; init-yasnippet.el --- Settings for yasnippet. -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package yasnippet
  :diminish yas-minor-mode
  :init (yas-global-mode)
  :config
  (add-to-list 'yas-snippet-dirs (concat
				                  (file-name-directory user-emacs-directory)
				                  "snippets"))
  (use-package yasnippet-snippets
    :after yasnippet)

  (use-package auto-yasnippet
    :bind (("C-o" . aya-open-line)
           ("H-w" . aya-create)
           ("H-y" . aya-expand))))

(provide 'init-yasnippet)

;;; Local Variables:
;;; coding: utf-8
;;; End:

;;; init-yasnippet.el ends here
