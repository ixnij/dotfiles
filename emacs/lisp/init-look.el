;;; init-look.el -- For appearance config  -*- lexical-binding: t; -*-

;;; Commentary:

;; Legacy code

;;
;; (defun ixnij/switch-theme ()
;;   (interactive)
;;   (let
;;       ((light-theme (cdr (assoc 'light ixnij/themes)))
;;        (dark-theme (cdr (assoc 'dark ixnij/themes))))
;;     (if (equal current-theme dark-theme)
;;	(progn
;;	  (disable-theme current-theme)
;;	  (load-theme light-theme t)
;;	  (setq current-theme light-theme))
;;       (progn
;;	(disable-theme current-theme)
;;	(load-theme dark-theme t)
;;	(setq current-theme dark-theme)))))

;; (defvar ixnij/themes
;;   '((light . modus-operandi)
;;     (dark . modus-vivendi))
;;   "The themes I'm using.")
;;
;; (defvar current-theme (cdr (assoc 'light ixnij/themes))
;;   "Current theme.")

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-oceanic-next t)
;;
;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;   (doom-themes-treemacs-config)
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))
;;
;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode)
;;   :config
;;   (setq doom-modeline-enable-word-count t)
;;   (setq doom-modeline-height 1)
;;   (set-face-attribute 'mode-line nil :family "Mononoki")
;;   (set-face-attribute 'mode-line-inactive nil :family "Iosevka"))

;;; Code:

(use-package modus-themes
  :ensure t
  :init
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-mixed-fonts t
	modus-themes-intense-mouseovers nil
	modus-themes-deuteranopia t
	modus-themes-tabs-accented t
	modus-themes-variable-pitch-ui nil
	modus-themes-subtle-line-numbers t
	modus-themes-inhibit-reload t ; only applies to `customize-set-variable' and related

	modus-themes-fringes nil ; {nil,'subtle,'intense}

	;; Options for `modus-themes-lang-checkers' are either nil (the
	;; default), or a list of properties that may include any of those
	;; symbols: `straight-underline', `text-also', `background',
	;; `intense' OR `faint'.
	modus-themes-lang-checkers nil

	;; Options for `modus-themes-mode-line' are either nil, or a list
	;; that can combine any of `3d' OR `moody', `borderless',
	;; `accented', a natural number for extra padding (or a cons cell
	;; of padding and NATNUM), and a floating point for the height of
	;; the text relative to the base font size (or a cons cell of
	;; height and FLOAT)
	modus-themes-mode-line '(moody accented borderless)

	;; Same as above:
	;; modus-themes-mode-line '(accented borderless 4 0.9)

	;; Options for `modus-themes-markup' are either nil, or a list
	;; that can combine any of `bold', `italic', `background',
	;; `intense'.
	modus-themes-markup '(background italic)

	;; Options for `modus-themes-syntax' are either nil (the default),
	;; or a list of properties that may include any of those symbols:
	;; `faint', `yellow-comments', `green-strings', `alt-syntax'
	modus-themes-syntax '(alt-syntax)

	;; Options for `modus-themes-hl-line' are either nil (the default),
	;; or a list of properties that may include any of those symbols:
	;; `accented', `underline', `intense'
	modus-themes-hl-line '(intense accented)

	;; Options for `modus-themes-paren-match' are either nil (the
	;; default), or a list of properties that may include any of those
	;; symbols: `bold', `intense', `underline'
	modus-themes-paren-match '(bold intense)

	;; Options for `modus-themes-links' are either nil (the default),
	;; or a list of properties that may include any of those symbols:
	;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
	;; `bold', `italic', `background'
	modus-themes-links '(neutral-underline background)

	;; Options for `modus-themes-box-buttons' are either nil (the
	;; default), or a list that can combine any of `flat', `accented',
	;; `faint', `variable-pitch', `underline', `all-buttons', the
	;; symbol of any font weight as listed in `modus-themes-weights',
	;; and a floating point number (e.g. 0.9) for the height of the
	;; button's text.
	modus-themes-box-buttons '(variable-pitch flat faint 0.9)

	;; Options for `modus-themes-prompts' are either nil (the
	;; default), or a list of properties that may include any of those
	;; symbols: `background', `bold', `gray', `intense', `italic'
	modus-themes-prompts '(intense bold)

	;; The `modus-themes-completions' is an alist that reads three
	;; keys: `matches', `selection', `popup'.  Each accepts a nil
	;; value (or empty list) or a list of properties that can include
	;; any of the following (for WEIGHT read further below):
	;;
	;; `matches' - `background', `intense', `underline', `italic', WEIGHT
	;; `selection' - `accented', `intense', `underline', `italic', `text-also' WEIGHT
	;; `popup' - same as `selected'
	;; `t' - applies to any key not explicitly referenced (check docs)
	;;
	;; WEIGHT is a symbol such as `semibold', `light', or anything
	;; covered in `modus-themes-weights'.  Bold is used in the absence
	;; of an explicit WEIGHT.
	modus-themes-completions '((matches . (extrabold))
				   (selection . (semibold accented))
				   (popup . (accented intense)))

	modus-themes-mail-citations nil ; {nil,'intense,'faint,'monochrome}

	;; Options for `modus-themes-region' are either nil (the default),
	;; or a list of properties that may include any of those symbols:
	;; `no-extend', `bg-only', `accented'
	modus-themes-region '(bg-only no-extend)

	;; Options for `modus-themes-diffs': nil, 'desaturated, 'bg-only
	modus-themes-diffs 'desaturated

	modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

	modus-themes-org-agenda ; this is an alist: read the manual or its doc string
	'((header-block . (variable-pitch 1.3))
	  (header-date . (grayscale workaholic bold-today 1.1))
	  (event . (accented varied))
	  (scheduled . uniform)
	  (habit . traffic-light))

	;;modus-themes-headings ; this is an alist: read the manual or its doc string
	;;'((1 . (variable-pitch 1.1))
	  ;;(2 . (rainbow variable-pitch 1.0))
	  ;;(3 . (rainbow variable-pitch 0.9))
	  ;;(4 . (rainbow variable-pitch 0.8))
	  ;;(5 . (rainbow variable-pitch 0.7))
	  ;;(t . (semibold variable-pitch 0.6)))
	))

(use-package doom-themes
  :ensure t
  :config
  (doom-themes-org-config)
  (doom-themes-visual-bell-config)
  )

;; if you do not want to use doom-modeline anymore,
;; then you might want to cancel the comment of moody
;(use-package moody
  ;:ensure t
  ;:when (display-graphic-p)
  ;:config
  ;(setq x-underline-at-descent-line t)
  ;(moody-replace-mode-line-buffer-identification)
  ;(moody-replace-vc-mode)
  ;(moody-replace-eldoc-minibuffer-message-function))

(defun ixnij/apply-theme-modus (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (modus-themes-load-operandi))
    ('dark (modus-themes-load-vivendi))))

;(use-package doom-modeline
  ;:ensure t
  ;:config
  ;(doom-modeline-mode +1))

(defun ixnij/apply-theme-doom-themes (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'doom-gruvbox-light t))
    ('dark (load-theme 'doom-ir-black t))))

(add-hook 'ns-system-appearance-change-functions #'ixnij/apply-theme-doom-themes)

;; Set theme for terminal
(when (not (display-graphic-p))
  (load-theme 'doom-moonlight t)
  ;;(modus-themes-load-vivendi) ;; dark
  )

(provide 'init-look)

;;; coding: utf-8
;;; init-look.el ends here
