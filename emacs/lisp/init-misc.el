;;; init-misc.el --- Miscellaneous and built-in.  -*- lexical-binding: t; -*-

;;; Commentary:

;; Code:

(use-package emacs
  :ensure nil
  :config
  (setq-default
   initial-scratch-message
   (concat
    ";; Love the World, "
    user-login-name
    " - Emacs by your side!\n;; Never forget the support of your family!\n\n"))
  (setq-default
   window-resize-pixelwise t
   frame-resize-pixelwise t)
  (setq inhibit-startup-screen t)
  (fset 'yes-or-no-p 'y-or-n-p) ;; emacs 28 has `use-short-answers'
  :bind
  ([remap list-buffers] . ibuffer))

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

(use-package repeat
  :ensure nil
  :hook (after-init . repeat-mode)
  :custom
  (repeat-exit-key (kbd "RET")))

(use-package whitespace
  :ensure nil
  :hook
  (after-init . global-whitespace-mode)
;  (after-init . global-whitespace-cleanup-mode)
;  :diminish
;  whitespace-cleanup-mode
  :config
  ;; Don't use different background for tabs.
  (face-spec-set 'whitespace-tab
		 '((t :background unspecified)))
  ;; Only use background and underline for long lines, so we can still have
  ;; syntax highlight.

  ;; For some reason use face-defface-spec as spec-type doesn't work. My guess
  ;; is it's due to the variables with the same name as the faces in
  ;; whitespace.el.  Anyway, we have to manually set some attribute to
  ;; unspecified here.
  (face-spec-set 'whitespace-line
		 '((((background light))
		    :background "#d8d8d8" :foreground unspecified
		    :underline t :weight unspecified)
		   (t
		    :background "#404040" :foreground unspecified
		    :underline t :weight unspecified)))

  ;; Use softer visual cue for space before tabs.
  (face-spec-set 'whitespace-space-before-tab
		 '((((background light))
		    :background "#d8d8d8" :foreground "#de4da1")
		   (t
		    :inherit warning
		    :background "#404040" :foreground "#ee6aa7")))

  (setq
   whitespace-line-column nil
   whitespace-style
   '(face             ; visualize things below:
     empty            ; empty lines at beginning/end of buffer
     lines-tail       ; lines go beyond `fill-column'
     space-before-tab ; spaces before tab
     trailing         ; trailing blanks
     tabs             ; tabs (show by face)
     tab-mark         ; tabs (show by symbol)
     )))

(use-package so-long
  :ensure nil
  :config (global-so-long-mode 1))

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))
(use-package winner-mode
  :ensure nil
  :hook (after-init . winner-mode))

(use-package restart-emacs)

;; MacOS specific
(use-package exec-path-from-shell
  :ensure t
  :when (eq system-type 'darwin)
  :hook (after-init . exec-path-from-shell-initialize))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(provide 'init-misc)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; end:
;;; init-misc.el ends here
