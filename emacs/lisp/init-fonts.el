;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;;(use-package ligature
;;  :ensure nil
;;  :config
;;  ;; Enable the "www" ligature in every possible major mode
;;  (ligature-set-ligatures 't '("www"))
;;  ;; Enable traditional ligature support in eww-mode, if the
;;  ;; `variable-pitch' face supports it
;;  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
;;  ;; Enable all Cascadia Code ligatures in programming modes
;;  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
;;				       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
;;				       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
;;				       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
;;				       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
;;				       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
;;				       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
;;				       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
;;				       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
;;				       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
;;				       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
;;				       "?=" "?." "??" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
;;				       "\\\\" "://"))
;;  ;; Enables ligature checks globally in all buffers. You can also do it
;;  ;; per mode with `ligature-mode'.
;;  (ligature-set-ligatures 'haskell-interactive-mode
;;			  (quote
;;			   ("=>"
;;			    "->"
;;			    "/="
;;			    "=="
;;			    "||"
;;			    "&&"
;;			    ">>"
;;			    "<<"
;;			    ">="
;;			    "<="
;;			    "++"
;;			    "::"
;;			    "->"
;;			   )))
;;  (global-ligature-mode t))

(require 'cl-lib)

(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(when (display-graphic-p)
  ;; Set default font
  (cl-loop for font in '("SF Mono" "Hack" "Source Code Pro" "Fira Code"
                         "Menlo" "Monaco" "DejaVu Sans Mono" "Consolas")
           when (font-installed-p font)
           return (set-face-attribute 'default nil
                                      :font font
                                      :height 160))
  ;; Specify font for all unicode characters
  (cl-loop for font in '("Apple Color Emoji" "Segoe UI Symbol" "Symbola" "Symbol")
           when (font-installed-p font)
           return (set-fontset-font t 'emoji (font-spec :family font)
				    nil 'prepend))

  ;; Specify font for Chinese characters
  (cl-loop for font in '("PingFang SC" "Microsoft Yahei")
           when (font-installed-p font)
           return (set-fontset-font t '(#x2ff0 . #x9fff)
				    (font-spec :family font
					       :size 18
					       )))
  (set-fontset-font t '(#x20000 . #x2A6DF)
                    (font-spec :name "HanaMinB"
                               :weight 'normal
                               :slant 'normal))
  (set-face-attribute 'fixed-pitch nil
		      :family (face-attribute 'default :family))

  (set-face-attribute 'variable-pitch nil
		      :family "SF Pro" :height 210))

(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
