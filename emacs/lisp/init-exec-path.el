;;; init-exec-path.el --- Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-

;;; Commentary:

;; This file is from purcell's emacs configuretion file.

;;; Code:

(require-package 'exec-path-from-shell)

(with-eval-after-load 'exec-path-from-shell
  (dolist (var '("PATH" "SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))

(when (or (memq window-system '(mac ns x))
	  (unless (memq system-type '(ms-dos windows-nt))
	    (daemonp)))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-exec-path.el ends here
