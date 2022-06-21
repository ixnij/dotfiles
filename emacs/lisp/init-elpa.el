;; init-elpa.el -- For elpa and package settings. -*- lexical-binding: t; -*-

;;; Commentary:

;; There are some functions that from others.
;; `require-package' and `maybe-require-package' is from purcell's Emacs configuretion file.
;; `find-fastest-mirror-for-me' is from @twlz0ne.

;;; Code:
(require 'package)

(defconst ixnij/package-mirror-alist
  '	((default
	  ("gnu"          . "https://elpa.gnu.org/packages/")
	  ("melpa"        . "https://melpa.org/packages/")
	  ("org"          . "https://orgmode.org/elpa/"))
	 (emacs-china
	  ("gnu"          . "https://elpa.emacs-china.org/gnu/")
	  ("melpa"        . "https://elpa.emacs-china.org/melpa/")
	  ("org"          . "https://elpa.emacs-china.org/org/"))
	 (tuna
	  ("gnu"          . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	  ("melpa"        . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	  ("org"          . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))
	 (sjtu
	  ("melpa"        . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
	  ("gnu"          . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
	  ;; ("org"          . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
	  ("nongnu"       . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/nongnu/")
	  )))
(setq package-archives
      (assoc-default 'sjtu ixnij/package-mirror-alist))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))
(eval-when-compile
  (require 'use-package))

;; Work-around for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(when
    (and
     (version< emacs-version "26.3")
     (boundp 'libgnutls-version)
     (>= libgnutls-version 30604))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(let
    ((package-check-signature nil))
  (use-package gnu-elpa-keyring-update))


(use-package request)
(defun find-fastest-mirror-for-me
    ()
  "Find the fatest mirror for me.

Inspied by @xuchunyang https://emacs-china.org/t/elpa/11192/9"
  (interactive)
  (require 'request)
  (with-output-to-temp-buffer "*Elpa mirror test*"
    (princ "  score (s)  mirror                        last updated\n")
    (princ "-----------  ----------------------------  ------------------\n"))
  (dolist
      (mirror ixnij/package-mirror-alist)
    (let
	((url
	  (cdr
	   (assoc "melpa" mirror)))
	 (begin-time
	  (float-time
	   (current-time)))
	 (request-backend
	  (car
	   '(curl url-retrieve))))
      (request
	(concat url "archive-contents")
	:timeout 30
	:complete
	(cl-function
	 (lambda
	   (&key response symbol-status &allow-other-keys)
	   (with-current-buffer "*Elpa mirror test*"
	     (goto-char
	      (point-max))
	     (let
		 ((inhibit-read-only t))
	       (insert
		(format "%11s  %-29s [%s]\n"
			(if
			    (eq symbol-status 'success)
			    (format
			     "%6fs"
			     (-
			      (float-time
			       (current-time))
			      begin-time))
			  symbol-status)
			(url-host
			 (url-generic-parse-url url))
			(if
			    (eq symbol-status 'success)
			    (request-response-header response "Last-Modified"))))))))))))
(provide 'init-elpa)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-elpa.el ends here
