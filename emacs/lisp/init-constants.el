;;; package --- init-constants.el
;;; Commentary:

;;; Code:

(defconst *is-mac* (eq system-type 'darwin)
  "Constant for check the System, macOS (Darwin).")
(defconst *is-linux* (eq system-type 'gnu/linux)
  "Constant for check the System, GNU/Linux.")
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
  "Constant for check the System, Windows NT or MSDOS.")

(provide 'init-constants)

;;; init-constant.el ends here
