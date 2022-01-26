;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package emacs
  :config
  (set-fontset-font t 'emoji (font-spec :family "Apple Color Emoji") nil 'prepend))

(use-package cnfonts
  :config (cnfonts-mode 1)
  (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
  (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)
  :custom
  (cnfonts-personal-fontnames
   '(;;英文字体
     ("Source Han Serif")
     ;;中文字体
     ("Source Han Serif SC"))))

(use-package ligature
  :ensure nil
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
				       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
				       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
				       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
				       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
				       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
				       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
				       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
				       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
				       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
				       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
				       "?=" "?." "??" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
				       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (ligature-set-ligatures 'haskell-interactive-mode
			  (quote
			   ("=>"
			    "->"
			    "/="
			    "=="
			    "||"
			    "&&"
			    ">>"
			    "<<"
			    ">="
			    "<="
			    "++"
			    "::"
			   )))
  (global-ligature-mode t))

(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
