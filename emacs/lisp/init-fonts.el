;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Mode-line font
(use-package emacs
  :config
  (if (not (version< emacs-version "29"))
      (progn
	(set-face-attribute 'mode-line-active nil :font "Baskerville 18")
	(set-face-attribute 'mode-line-inactive nil :font "Fira code 14"))))

(use-package cnfonts
  :config (cnfonts-mode 1)
  (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
  (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize))

(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
