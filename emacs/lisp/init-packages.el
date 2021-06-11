;;; 
;;; File name: init-packages.el
;;;


(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

(use-package restart-emacs) ;; will fix

(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))
;; To move drag

(use-package hungry-delete
    :bind (("C-c DEL" . hungry-delete-backward) ; Not the `delete` menu on the keyborad!
           ("C-c d" . hungry-delete-forward))) 

(use-package crux
  :bind ("C-c k" . crux-smart-kill-line))

(use-package ivy
 :defer 1
 :demand
 :hook (after-init . ivy-mode)
 :config
 (ivy-mode 1)
 (setq ivy-use-virtual-buffers t
       ivy-initial-inputs-alist nil
       ivy-count-format "%d/%d "
       enable-recursive-minibuffers t
       ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t)) 
;; They require the ivy..

;; Complete plugin: company

(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 2
        company-show-numbers t
        company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))

;; optimization some operations..

(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c ^" . crux-top-join-line)
         ("C-x ," . crux-find-user-init-file)
         ("C-c k" . crux-smart-kill-line))) 

(use-package which-key
  :defer nil
  :config (which-key-mode))

;; the syntax check plugin

(use-package flycheck
  :hook (after-init . global-flycheck-mode))

;; Turbo windows tiling..

(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; this must be in here

(provide 'init-packages)

;;; init-packages.el ends here
