;;; init-packages.el --- Install and config packages. -*- lexical-binding:t -*-
;;; Commentary:
;;; init-packages.el

;;; Code:

(require 'init-constants)
(require 'use-package)

(use-package restart-emacs)

(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))
;; To move drag

(use-package hungry-delete
    :bind (("C-c DEL" . hungry-delete-backward) ; Not the `delete` menu on the keyborad!
           ("C-c d" . hungry-delete-forward)))

(use-package disk-usage
  :commands (disk-usage))

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

(use-package markdown-mode)

;; (use-package beacon
  ;; :hook (after-init . beacon-mode))

;; Using the following Package instead beacon.

;; Show native line numbers if possible, otherwise use `linum'
(if (fboundp 'display-line-numbers-mode)
    (use-package display-line-numbers
      :ensure nil
      :hook (prog-mode . display-line-numbers-mode))
  (use-package linum-off
    :demand
    :defines linum-format
    :hook (after-init . global-linum-mode)
    :init (setq linum-format "%4d ")
    :config
    ;; Highlight current line number
    (use-package hlinum
      :defines linum-highlight-in-all-buffersp
      :custom-face (linum-highlight-face ((t (:inherit default :background nil :foreground nil))))
      :hook (global-linum-mode . hlinum-activate)
      :init (setq linum-highlight-in-all-buffersp t))))

(provide 'init-packages)
;; Local Variables:
;; coding: utf-8
;; End:

;;; init-packages.el ends here
