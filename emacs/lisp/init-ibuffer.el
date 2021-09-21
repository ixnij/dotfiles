;;; init-ibuffer.el --- For ibuffer  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require-package 'ibuffer-vc)

(with-eval-after-load 'ibuffer
  ;; Use human readable Size column instead of original one
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size))))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
	      (name 22 22 :left :elide)
	      " "
	      (size-h 9 -1 :right)
	      " "
	      (mode 12 12 :left :elide)
	      " "
	      vc-relative-file)
	(mark modified read-only vc-status-mini " "
	      (name 22 22 :left :elide)
	      " "
	      (size-h 9 -1 :right)
	      " "
	      (mode 14 14 :left :elide)
	      " "
	      (vc-status 12 12 :left)
	      " "
	      vc-relative-file)))

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
