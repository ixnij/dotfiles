;;; init-key.el -- Set some key bindings.
;;; Commentary:
;;; init-key.el

;;; Code:

(require 'init-constants)

(when sys/darwinp
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'none))

(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))


(provide 'init-key)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:

;;; init-key.el ends here
