;;; init-ibuffer.el --- For ibuffer  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require-package 'ibuffer-vc)

(with-eval-after-load 'ibuffer
  ;; Use human readable Size column instead of original one
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size))))

(defun ibuffer-set-up-preferred-filters ()
  (ibuffer-vc-set-filter-groups-by-vc-root)
  (unless (eq ibuffer-sorting-mode 'filename/process)
    (ibuffer-do-sort-by-filename/process)))

(add-hook 'ibuffer-hook 'ibuffer-set-up-preferred-filters)

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
