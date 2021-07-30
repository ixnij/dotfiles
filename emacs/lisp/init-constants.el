;;; init-constants.el --- define some constants. -*- lexical-binding:t -*-
;;; Commentary:

;;; Code:

(defconst sys/darwinp (eq system-type 'darwin)
  "Constant for check the System, macOS (Darwin).")
(defconst sys/linuxp (eq system-type 'gnu/linux)
  "Constant for check the System, GNU/Linux.")
(defconst sys/winntp (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
  "Constant for check the System, Windows NT or MSDOS.")

(defconst clangd-p
  (or (executable-find "clangd")  ;; usually
      (executable-find "/usr/local/opt/llvm/bin/clangd"))  ;; macOS
  "Do we have clangd?")

(provide 'init-constants)

;; Local Variables:
;; coding: utf-8
;; End:

;;; init-constants.el ends here
