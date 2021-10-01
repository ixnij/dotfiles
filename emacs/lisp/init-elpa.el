;; init-elpa.el -- For elpa and package settings. -*- lexical-binding: t; -*-

;;; Commentary:

;; There are some functions that from others.
;; `require-package' and `maybe-require-package' is from purcell's emacs configuretion file.
;; `find-fastest-mirror-for-me' is from @twlz0ne.

;;; Code:

(require 'package)

(defconst package-mirror-alist
  '((default
      ("gnu"          . "https://elpa.gnu.org/packages/")
      ("melpa"        . "https://melpa.org/packages/")
      ("org"          . "https://orgmode.org/elpa/"))
    (emacs-china
     ("gnu"          . "https://elpa.emacs-china.org/gnu/")
     ("melpa"        . "https://elpa.emacs-china.org/melpa/")
     ("org"          . "https://elpa.emacs-china.org/org/"))
    (sjtu
     ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
     ("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
     ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
     )))

(setq package-archives (assoc-default 'default package-mirror-alist)) 

;; Work-around for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(when (and (version< emacs-version "26.3") (boundp 'libgnutls-version) (>= libgnutls-version 30604))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

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

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))

(let ((package-check-signature nil))
  (require-package 'gnu-elpa-keyring-update))
(package-initialize)

(require-package 'request)
(defun find-fastest-mirror-for-me ()
  "Find the fatest mirror for me.

Inspied by @xuchunyang https://emacs-china.org/t/elpa/11192/9"
  (interactive)
  (require 'request)
  (with-output-to-temp-buffer "*Elpa mirror test*"
    (princ "  score (s)  mirror                        last updated\n")
    (princ "-----------  ----------------------------  ------------------\n"))
  (dolist (mirror package-mirror-alist)
    (let ((url (cdr (assoc "melpa" mirror)))
	  (begin-time (float-time (current-time)))
	  (request-backend (car '(curl url-retrieve))))
      (request (concat url "archive-contents")
	:timeout 30
	:complete
	(cl-function
	 (lambda (&key response symbol-status &allow-other-keys)
	   (with-current-buffer "*Elpa mirror test*"
	     (goto-char (point-max))
	     (let ((inhibit-read-only t))
	       (insert (format "%11s  %-29s [%s]\n"
			       (if (eq symbol-status 'success)
				   (format
				    "%6fs"
				    (- (float-time (current-time)) begin-time))
				 symbol-status)
			       (url-host (url-generic-parse-url url))
			       (if (eq symbol-status 'success)
				   (request-response-header response "Last-Modified"))))))))))))

(provide 'init-elpa)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-elpa.el ends here
