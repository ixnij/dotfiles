;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary

;; (set-face-attribute 'default nil :font "Iosevka" :height 160)
;; (set-face-attribute 'default nil :font "SF Mono" :height 140)

;;; Code:

(require 'cl-lib)

(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(when (display-graphic-p)
  ;; Set default font
  (cl-loop for font in '("SF Mono" "Iosevka" "Source Code Pro" "Fira Code"
			 "Menlo" "Monaco" "DejaVu Sans Mono" "Consolas")
	   when (font-installed-p font)
	   return (set-face-attribute 'default nil
				      :font font
				      :height 160))

  ;; Specify font for all unicode characters
  (cl-loop for font in '("Apple Color Emoji" "Segoe UI Symbol" "Symbola" "Symbol")
	   when (font-installed-p font)
	   return(set-fontset-font t 'unicode font nil 'prepend))

  ;; Specify font for Chinese characters
  (cl-loop for font in '("WenQuanYi Micro Hei" "Microsoft Yahei")
	   when (font-installed-p font)
	   return (set-fontset-font t '(#x4e00 . #x9fff) font)))

(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
