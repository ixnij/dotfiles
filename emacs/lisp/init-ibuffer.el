;;; init-ibuffer.el --- For ibuffer  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(with-eval-after-load 'ibuffer
  ;; Use human readable Size column instead of original one
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size))))

(setq ibuffer-saved-filter-groups
      '((
	 ("Hidden"  (name . "^ "))
	 ("Woman"  (name . "^\\*WoMan.*\\*$"))
	 ("Compile"  (name . "^*.*compil[ea].*$"))
	 ("Gtalk"  (or (name . "^\\*.*jabber") (name . "*fsm-debug*")))
	 ("ERC"  (mode . erc-mode))
	 ("Custom"  (mode . Custom-mode))
	 ("Shell"  (mode . shell-mode))
	 ("Mail" (or (mode . mew-summary-mode) (mode . mew-draft-mode)(mode . mew-message-mode)))
	 ("VC"  (or (name . "*magit-") (name . "^\\*vc")(mode . diff-mode) (mode . vc-dir-mode)))
	 ("Magit "  (name . "*magit:"))
	 ("Emacs"  (name . "^\\*.*$"))
	 ("Dired"  (mode . dired-mode))
	 ("Go"  (mode . go-mode))
	 ("Python"  (mode . python-mode))
	 ("Emacs Lisp"  (mode . emacs-lisp-mode))
	 )))

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
