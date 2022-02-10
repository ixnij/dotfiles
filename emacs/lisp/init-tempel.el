;; init tempel dot el  -*- lexical-binding: t; -*-

;; Configure Tempel
(use-package tempel
  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))

  :init

  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; The depth is set to -1, such that `tempel-expand' is tried *before* the
    ;; programming mode Capf. If a template name can be completed it takes
    ;; precedence over the programming mode completion. `tempel-expand' only
    ;; triggers on exact matches. Alternatively use `tempel-complete' if you
    ;; want to see all matches, but then Tempel will probably trigger too
    ;; often when you don't expect it.
    (add-hook 'completion-at-point-functions #'tempel-expand -1 'local))

  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (tempel-global-abbrev-mode)
)

(provide (quote init-tempel))
;; init tempel dot el ends here
