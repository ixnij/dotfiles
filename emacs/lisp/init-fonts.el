;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

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
			    "->"
			   )))
  (global-ligature-mode t))

(use-package emacs
  :ensure nil
  :config
  (set-face-attribute 'default nil :family "SF Mono" :height 160)
  (set-fontset-font t '(#x2ff0 . #x9ffc) ;; This is cjk font set
		    (font-spec :family "PingFang SC"
			       :weight 'normal
			       :slant 'normal))
  (set-fontset-font t '(#x20000 . #x2A6DF)
                                    (font-spec :name "HanaMinB"
                                               :weight 'normal
                                               :slant 'normal)))

(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
