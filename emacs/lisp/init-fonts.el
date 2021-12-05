;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(when (maybe-require-package 'cnfonts)
  (require 'cnfonts)
  (cnfonts-mode 1)
  (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
  (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize))

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
(progn
  (set-face-attribute 'mode-line-active nil :font "Baskerville-18")
  (set-face-attribute 'mode-line-inactive nil :font "Baskerville-18"))

(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
