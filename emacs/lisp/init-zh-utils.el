;;; init-zh-utils.el --- Chinese utils.  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; Cnfonts
(when (maybe-require-package 'cnfonts)
  (require 'cnfonts)
  (cnfonts-enable))

;; Pyim

(when ixnij/enable-pyim-p
  (when (maybe-require-package 'pyim)
    (require 'pyim)
    (require-package 'pyim-basedict)
    (require 'pyim-basedict)
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

(when (maybe-require-package 'fanyi)
  (require 'fanyi)
  )

(provide 'init-zh-utils)
;;; init-zh-utils.el ends here
