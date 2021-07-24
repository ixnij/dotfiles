;;; packege --- init-look.el
;;; Commentary:
;;; init-look.el

;;; Code:

(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))

(use-package smart-mode-line
    :init
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful)
    (sml/setup))

;; For font setting on windows
(use-package emacs
  :if (display-graphic-p)
  :config
  ;; Font settings
  (if *is-windows*
    (progn
      (set-face-attribute 'default nil :font "Cascadia Code 12")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Microsoft Yahei Mono" :size 12))))
    (if *is-mac*
	(set-face-attribute 'default nil :font "SF Mono 16")
        (set-face-attribute 'default nil :font "Fira Code 16"))))

;; end

(use-package emacs
    :config
    (setq display-line-numbers-type 't) ;; or visual, relative
    (global-display-line-numbers-mode t))

;; the following line must be put in the last of file

(provide 'init-look)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-look.el ends here
