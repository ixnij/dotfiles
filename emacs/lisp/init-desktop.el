;;; init-desktop.el --- Auto save desltop file.  -*- lexical-binding: t -*-

;;; Commentary:

;; Copy from a firend from emacs-china.

;;; Code:

(use-package desktop
  :commands restart-emacs-without-desktop
  :init (desktop-save-mode)
  :config
  ;; inhibit no-loaded prompt
  (setq desktop-file-modtime (file-attribute-modification-time
                              (file-attributes
                               (desktop-full-file-name)))
        desktop-lazy-verbose nil
        desktop-load-locked-desktop t
        desktop-restore-eager 1
        desktop-restore-frames nil
        desktop-save t)

  (defun restart-emacs-without-desktop (&optional args)
    "Restart emacs without desktop."
    (interactive)
    (restart-emacs (cons "--no-desktop" args))))

(provide 'init-desktop)
;; Local Variables:
;; coding: utf-8
;; End:

;;; init-desktop.el ends here
