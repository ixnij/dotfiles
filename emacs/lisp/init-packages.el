;;; init-packages.el --- Install and config packages. -*- lexical-binding:t -*-
;;; Commentary:
;;; init-packages.el

;;; Code:

(require 'init-constants)

(use-package restart-emacs)

(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))
;; To move drag

(use-package hungry-delete
    :bind (("C-c DEL" . hungry-delete-backward) ; Not the `delete` menu on the keyborad!
           ("C-c d" . hungry-delete-forward)))

(use-package crux
  :bind ("C-c k" . crux-smart-kill-line))

;; They require the ivy..

;; Complete plugin: company


;; optimization some operations..

(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c ^" . crux-top-join-line)
         ("C-x ," . crux-find-user-init-file)
         ("C-c k" . crux-smart-kill-line)))
(use-package which-key
  :defer nil
  :config (which-key-mode))

(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; Very fourmos packages.
(use-package magit)

(use-package treemacs)

;; hignlighting for current line.

(use-package beacon
  :unless sys/winntp
  :hook (after-init . beacon-mode))

;; this must be in here

(provide 'init-packages)

;; Local Variables:
;; coding: utf-8
;; End:

;;; init-packages.el ends here
