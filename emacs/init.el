;;; init.el --- Bootstraps the full configuretion.  -*- lexical-binding: t; -*-

;;; Commentary:

;; The `add-subdirs-to-load-path' was copied from manateelazycat.
;; See line 136 ~ 141 at https://manateelazycat.github.io/eaf/emacs/2020/05/10/eaf-community.html.

;;; Code:

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.emacs.d/site-lisp")
(setq read-process-output-max (* 1024 1024))

;; package.el
(setq package-quickstart t)
(package-initialize) ;; do not forget it
(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-elpa)
(use-package diminish)

(when (eq system-type 'darwin)
  (require 'init-mackeys)
  (use-package ns-auto-titlebar
    :config
    (ns-auto-titlebar-mode)))

;; editing
(require 'init-evil)
(require 'init-edit)

;; appearance
(require 'init-look)
(require 'init-fonts)

(require 'init-minibuffer)

(require 'init-company)

(require 'init-git)

;; misc
(require 'init-misc)

;; I don't know where I can put them.
(use-package haskell-mode)
(use-package rust-mode
  :custom
  (rust-format-on-save (executable-find "rustfmt")))

;; copied from condy
(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp-deferred)
  :bind (:map lsp-mode-map
         ("C-c f" . lsp-format-region)
         ("C-c d" . lsp-describe-thing-at-point)
         ("C-c a" . lsp-execute-code-action)
         ("C-c r" . lsp-rename))
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-enable-links t)                 ;; no clickable links
  (lsp-enable-folding t)               ;; use `hideshow' instead
  (lsp-enable-snippet t)               ;; no snippets, it requires `yasnippet'
  (lsp-enable-file-watchers nil)         ;; performance matters
  (lsp-enable-text-document-color nil)   ;; as above
  (lsp-enable-symbol-highlighting nil)   ;; as above
  (lsp-enable-on-type-formatting nil)    ;; as above
  (lsp-enable-indentation nil)           ;; don't change my code without my permission
  (lsp-headerline-breadcrumb-enable nil) ;; keep headline clean
  (lsp-modeline-code-actions-enable nil) ;; keep modeline clean
  (lsp-modeline-diagnostics-enable nil)  ;; as above
  (lsp-log-io nil)                       ;; debug only
  (lsp-auto-guess-root t)                ;; auto guess root
  (lsp-keep-workspace-alive t)         ;; auto kill lsp server
  (lsp-eldoc-enable-hover nil))

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
