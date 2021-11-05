;;; init-fonts.el --- Settings for fonts.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Auto generated by cnfonts
;; <https://github.com/tumashu/cnfonts>
(when
    (display-graphic-p)
  (set-face-attribute
   'default nil
   :font
   (font-spec :name "-*-Iosevka Term-ultraheavy-italic-expanded-*-*-*-*-*-m-0-iso10646-1"
	      :weight 'normal
	      :slant 'normal
	      :size 12.5))
  (dolist
      (charset
       '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-Hiragino Sans GB-medium-normal-normal-*-*-*-*-*-p-0-iso10646-1"
		:weight 'normal
		:slant 'normal
		:size 15.0))))
(let
((emoji-support-version "29.0"))
(when
(and
(not
(version< emacs-version emoji-support-version))
system-darwin-p)
(set-fontset-font t 'emoji
'("Apple Color Emoji" . "iso10646-1")
nil 'prepend)
)
)
(provide 'init-fonts)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-fonts.el ends here
