;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'cnfonts)
  (require 'cnfonts)
  (cnfonts-mode 1)
  (setq cnfonts-use-face-font-rescale t)
  (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
  (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)
  (defvar ixnij/line-spacing-alist
    '((9 . 0.1) (10 . 0.9) (11.5 . 0.2)
      (12.5 . 0.2) (14 . 0.2) (16 . 0.2)
      (18 . 0.2) (20 . 1.0) (22 . 0.2)
      (24 . 0.2) (26 . 0.2) (28 . 0.2)
      (30 . 0.2) (32 . 0.2)))

  (defun ixnij/line-spacing-setup (fontsizes-list)
    (let ((fontsize (car fontsizes-list))
	  (line-spacing-alist (copy-list ixnij/line-spacing-alist)))
      (dolist (list line-spacing-alist)
	(when (= fontsize (car list))
	  (setq line-spacing-alist nil)
	  (setq-default line-spacing (cdr list))))))
  (setq cnfonts-personal-fontnames '(("Sarasa Gothic SC") nil nil nil nil))

  (add-hook 'cnfonts-set-font-finish-hook #'ixnij/line-spacing-setup))

(let
    ((emoji-supported-version "29.0"))
  (when
      (and
       (not
	(version< emacs-version emoji-supported-version))
       system-darwin-p)
    (set-fontset-font t 'emoji
		      '("Apple Color Emoji" . "iso10646-1")
		      nil 'prepend)))
;; Mode-line font
;(progn
;  (set-face-attribute 'mode-line-active nil :font "Baskerville 18")
;  (set-face-attribute 'mode-line-inactive nil :font "Fira code 14"))

(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
