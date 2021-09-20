;;; init-desktop.el --- For sessions  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)
(provide 'init-desktop)
;;; init-desktop.el ends here
