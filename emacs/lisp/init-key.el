;;; init-key.el -- Set some key bindings. -*- lexical-binding:t -*-
;;; Commentary:
;;; init-key.el

;;; Code:

(require 'init-constants)

(when sys/darwinp
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'none))

(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

(progn (define-prefix-command 'ctl-z-map)
   (global-set-key (kbd "C-z") 'ctl-z-map))

(provide 'init-key)

;; Local Variables:
;; coding: utf-8
;; End:

;;; init-key.el ends here
