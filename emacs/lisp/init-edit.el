;;; init-edit.el --- Editing utils.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package page-break-lines
  :ensure t
  :diminish
  :hook (after-init . global-page-break-lines-mode))

;; Highlight brackets according to their depth
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;;(use-package whitespace
;;  :ensure nil
;;  :hook (prog-mode . whitespace-mode)
;;  :diminish
;;  :config
;;  ;; Don't use different background for tabs.
;;  (face-spec-set 'whitespace-tab
;;                 '((t :background unspecified)))
;;  ;; Only use background and underline for long lines, so we can still have
;;  ;; syntax highlight.
;;
;;  ;; For some reason use face-defface-spec as spec-type doesn't work.  My guess
;;  ;; is it's due to the variables with the same name as the faces in
;;  ;; whitespace.el.  Anyway, we have to manually set some attribute to
;;  ;; unspecified here.
;;  (face-spec-set 'whitespace-line
;;                 '((((background light))
;;                    :background "#d8d8d8" :foreground unspecified
;;                    :underline t :weight unspecified)
;;                   (t
;;                    :background "#404040" :foreground unspecified
;;                    :underline t :weight unspecified)))
;;
;;  ;; Use softer visual cue for space before tabs.
;;  (face-spec-set 'whitespace-space-before-tab
;;                 '((((background light))
;;                    :background "#d8d8d8" :foreground "#de4da1")
;;                   (t
;;                    :inherit warning
;;                    :background "#404040" :foreground "#ee6aa7")))

;;  (setq
;;   whitespace-line-column nil
;;   whitespace-style
;;   '(face             ; visualize things below:
;;     empty            ; empty lines at beginning/end of buffer
;;     lines-tail       ; lines go beyond `fill-column'
;;     space-before-tab ; spaces before tab
;;     trailing         ; trailing blanks
;;     tabs             ; tabs (show by face)
;;     tab-mark         ; tabs (show by symbol)
;;     )))
(use-package emacs
  :ensure nil
  :hook (prog-mode . display-fill-column-indicator-mode))

;; Automatic parenthesis pairing
;;(use-package elec-pair
  ;;:ensure nil
  ;;:hook ((emacs-lisp-mode . electric-pair-local-mode)
	 ;;(c-or-c++-mode . electric-pair-local-mode)
	 ;;(rust-mode . electric-pair-local-mode)
	 ;;(haskell-mode . electric-pair-local-mode))
  ;;:init
  ;;(setq
   ;;electric-pair-inhibit-predicate
;;'electric-pair-conservative-inhibit))

;; see https://www.emacswiki.org/emacs/ParEdit
(use-package paredit
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (use-package eldoc
    :ensure nil
    :config
    (eldoc-add-command
     'paredit-backward-delete
     'paredit-close-round))
  (defvar electrify-return-match
    "[\]}\)\"]"
    "If this regexp matches the text after the cursor, do an \"electric\"
  return.")
  (defun electrify-return-if-match (arg)
    "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
    (interactive "P")
    (let ((case-fold-search nil))
      (if (looking-at electrify-return-match)
      (save-excursion (newline-and-indent)))
      (newline arg)
      (indent-according-to-mode)))
  (defun electrify-return-hookfn ()
    (local-set-key (kbd "RET") 'electrify-return-if-match))
  (add-hook 'lisp-mode-hook #'electrify-return-hookfn)
  (add-hook 'emacs-lisp-mode-hook #'electrify-return-hookfn)
  (add-hook 'scheme-mode-hook #'electrify-return-hookfn)
  (add-hook 'ielm-mode-hook #'electrify-return-hookfn)
  (add-hook 'lisp-interaction-mode-hook #'electrify-return-hookfn)
  (add-hook 'emacs-lisp-mode-hook
	    (lambda ()
	      (paredit-mode t)
	      (turn-on-eldoc-mode)
	      (eldoc-add-command
	       'paredit-backward-delete
	       'paredit-close-round)
	      (local-set-key (kbd "RET") 'electrify-return-if-match)
	      (eldoc-add-command 'electrify-return-if-match)
	      (show-paren-mode t)))
  )

(provide 'init-edit)

;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-edit.el ends here
