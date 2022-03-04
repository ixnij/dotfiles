;; init fns dot el --- custom functions  -*- lexical-binding: t; -*-

(defun open-configuration-config ()
  "Open the config file in the configuration directory."
  (interactive)
  (let (path filename)
    (while (or (null filename)
               (string= filename ".."))
      (setq path (pcase (completing-read
                         "Enter the index of config: "
                         '("all" "minibuffer" "misc" "init"))
                   ("all" "~/.emacs.d/lisp")
                   ("minibuffer" "~/.emacs.d/lisp/init-minibuffer.el")
                   ("misc" "~/.emacs.d/lisp/init-misc.el")
                   ("init" "~/.emacs.d/init.el")
      (if (not (string= path "~/.emacs.d/init.el"))
          (setq filename (completing-read "Enter the filename: "
                                          (delete "." (directory-files path))))
        (setq filename "")))
    (find-file (concat path filename))

(provide 'init-fns)
;; init fns dot el ends here
