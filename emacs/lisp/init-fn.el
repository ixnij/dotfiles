;;; init-fn.el --- Define some functions. -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(defun show-user-login-info ()
  "Print the System informations when user login."
  (let ((os-version (format ";; %20s: %S\n" "Operating System" system-type))
        (user-names (format ";; %20s: %s\n" "Login User" (user-login-name)))
        (machine-name (format ";; %20s: %s\n" "Machine Name" (system-name)))
        (suffix ";; Happy Hacking!"))
    (concat ";;\n" os-version user-names machine-name ";;\n" suffix)))

(provide 'init-fn)
;;; init-fn.el ends here
