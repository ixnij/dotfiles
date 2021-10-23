;;; init-zh-utils.el --- Chinese utils.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Cnfonts
(when (maybe-require-package 'cnfonts)
  (require 'cnfonts)
  (cnfonts-enable)
  (setq cnfonts-use-face-font-rescale t))



;; Pyim

(when ixnij/enable-pyim-p
  (when (maybe-require-package 'pyim)
    (require 'pyim)
    (require-package 'pyim-basedict)
    (require 'pyim-basedict)
    (require 'posframe)
    (pyim-basedict-enable)
    (setq default-input-method "pyim")
    (pyim-default-scheme 'quanpin)
    (pyim-isearch-mode 1)
    (diminish 'pyim-isearch-mode)
    (if (posframe-workable-p)
	(setq pyim-page-tooltip 'posframe)
      (setq pyim-page-tooltip 'popup))
    (setq pyim-page-length 5)
    (when ixnij/pyim-use-rime-p
      (require-package 'liberime)
      (require 'liberime nil t)
      (with-eval-after-load "liberime"
	(liberime-try-select-schema "luna_pinyin_simp")
	(setq pyim-default-scheme 'rime-quanpin)))))



;; Emacs-rime

(when ixnij/enable-emacs-rime-p
  (when (maybe-require-package 'rime)
    (require 'rime)
    (setq default-input-method "rime")
    (setq rime-librime-root "~/.emacs.d/librime/dist")
    (setq rime-emacs-module-header-root "/opt/homebrew/Cellar/emacs-plus@28/28.0.50/include")
    (setq rime-show-candidate 'posframe)))

;; (when (maybe-require-package 'fanyi)
;;   (require 'fanyi)
;;   )

;; See Emacs-china: https://emacs-china.org/t/google/14407/63
;; (when (and (maybe-require-package 'go-translate) (require 'go-translate nil t))
;;   (setq gts-translate-list '(("en" "zh") ("zh" "en")))
;;   ;; 配置默认的 translator,配置完成之后，gts-do-translate 命令将用这些配置进行翻译
;;   (setq gts-default-translator
;;	(gts-translator
;;
;;	 :picker
;;	 ;; 选择其中一个 picker，用于拾取初始文本、from、to
;;
;;	 ;;(gts-noprompt-picker)
;;	 ;;(gts-noprompt-picker :texter (gts-whole-buffer-texter))
;;	 (gts-prompt-picker)
;;	 ;;(gts-prompt-picker :single t)
;;	 ;;(gts-prompt-picker :texter (gts-current-or-selection-texter) :single t)
;;
;;	 :engines
;;	 ;; 设定若干翻译引擎，可以是一个，可以多个
;;	 ;; 通过传入不同的 parser,配置其不同样式的输出
;;
;;	 (list
;;	  (gts-google-engine)
;;	  (gts-google-rpc-engine)
;;	  ;;(gts-deepl-engine :auth-key "3e10bade-88e9-02f2-169f-ab3c445d7984:fx" :pro nil)
;;
;;	  ;;(gts-google-engine :parser (gts-google-summary-parser))
;;	  ;;(gts-google-engine :parser (gts-google-parser))
;;	  (gts-google-rpc-engine :parser (gts-google-rpc-summary-parser))
;;	  ;;(gts-google-rpc-engine :parser (gts-google-rpc-summary-parser))
;;	  )
;;
;;	 :render
;;	 ;; 选定一个渲染器，从而将结果输出到不同目标
;;	 ;; 推荐安装 posframe，并使用 gts-posframe-pop-render 或 gts-posframe-pin-render
;;
;;	 ;;(gts-buffer-render)
;;
;;	 ;;(gts-posframe-pop-render)
;;	 ;;(gts-posframe-pop-render :backcolor "#333333" :forecolor "#ffffff")
;;
;;	 ;;(gts-posframe-pin-render)
;;	 (gts-posframe-pin-render :position (cons 1200 20))
;;	 ;;(gts-posframe-pin-render :width 80 :height 25 :position (cons 1000 20) :forecolor "#ffffff" :backcolor "#111111")
;;
;;	 ;;(gts-kill-ring-render)
;;	 )))

(provide 'init-zh-utils)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init-zh-utils.el ends here
