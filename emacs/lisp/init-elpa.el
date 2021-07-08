;;; package --- init-elpa.el
;;; Commentary:
;;; init-elpa.el

;;; Code:

;; software source

(setq package-archives '(
    ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")
    ("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
    ("org" . "http://mirrors.bfsu.edu.cn/elpa/org/")))

;; for package.el

(setq package-check-signature nil) 
(require 'package) ;; package.el: init
(unless (bound-and-true-p package--initialized)
   (package-initialize)) ;; update index
(unless package-archive-contents
    (package-refresh-contents))

;; install use-package

(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))

;; use-package setting:

(eval-and-compile
    (setq use-package-always-ensure t)
    (setq use-package-always-defer t) 
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t))

(require 'use-package)

;; This function was copied from Purcell's emacs.d,

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (best (car (sort known (lambda (a b)
                                      (version-list-<= (package-desc-version b)
                                                       (package-desc-version a)))))))
        (if (and best (version-list-<= min-version (package-desc-version best)))
            (package-install best)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
            (require-package package min-version t)))
        (package-installed-p package min-version))))

;; provide a name to call.

(provide 'init-elpa)

;;; init-elpa.el ends here
