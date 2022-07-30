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
	)
  ;;https://protesilaos.com/codelog/2022-07-26-modus-themes-color-override-demo/?utm_source=pocket_mylist
(setq modus-themes-operandi-color-overrides
      '((bg-main . "#fff0f2")
	(bg-dim . "#fbe6ef")
	(bg-alt . "#f5dae6")
	(bg-hl-line . "#fad8e3")
	(bg-active . "#efcadf")
	(bg-inactive . "#f3ddef")
	(bg-active-accent . "#ffbbef")
	(bg-region . "#dfc5d1")
	(bg-region-accent . "#efbfef")
	(bg-region-accent-subtle . "#ffd6ef")
	(bg-header . "#edd3e0")
	(bg-tab-active . "#ffeff2")
	(bg-tab-inactive . "#f8d3ef")
	(bg-tab-inactive-accent . "#ffd9f5")
	(bg-tab-inactive-alt . "#e5c0d5")
	(bg-tab-inactive-alt-accent . "#f3cce0")
	(fg-main . "#543f78")
	(fg-dim . "#5f476f")
	(fg-alt . "#7f6f99")
	(fg-unfocused . "#8f6f9f")
	(fg-active . "#563068")
	(fg-inactive . "#8a5698")
	(fg-docstring . "#5f5fa7")
	(fg-comment-yellow . "#a9534f")
	(fg-escape-char-construct . "#8b207f")
	(fg-escape-char-backslash . "#a06d00")
	(bg-special-cold . "#d3e0f4")
	(bg-special-faint-cold . "#e0efff")
	(bg-special-mild . "#c4ede0")
	(bg-special-faint-mild . "#e0f0ea")
	(bg-special-warm . "#efd0c4")
	(bg-special-faint-warm . "#ffe4da")
	(bg-special-calm . "#f0d3ea")
	(bg-special-faint-calm . "#fadff9")
	(fg-special-cold . "#405fb8")
	(fg-special-mild . "#407f74")
	(fg-special-warm . "#9d6f4f")
	(fg-special-calm . "#af509f")
	(bg-completion . "#ffc5e5")
	(bg-completion-subtle . "#f7cfef")
	(red . "#ed2f44")
	(red-alt . "#e0403d")
	(red-alt-other . "#e04059")
	(red-faint . "#ed4f44")
	(red-alt-faint . "#e0603d")
	(red-alt-other-faint . "#e06059")
	(green . "#217a3c")
	(green-alt . "#417a1c")
	(green-alt-other . "#006f3c")
	(green-faint . "#318a4c")
	(green-alt-faint . "#518a2c")
	(green-alt-other-faint . "#20885c")
	(yellow . "#b06202")
	(yellow-alt . "#a95642")
	(yellow-alt-other . "#a06f42")
	(yellow-faint . "#b07232")
	(yellow-alt-faint . "#a96642")
	(yellow-alt-other-faint . "#a08042")
	(blue . "#275ccf")
	(blue-alt . "#475cc0")
	(blue-alt-other . "#3340ef")
	(blue-faint . "#476ce0")
	(blue-alt-faint . "#575ccf")
	(blue-alt-other-faint . "#3f60d7")
	(magenta . "#bf317f")
	(magenta-alt . "#d033c0")
	(magenta-alt-other . "#844fe4")
	(magenta-faint . "#bf517f")
	(magenta-alt-faint . "#d053c0")
	(magenta-alt-other-faint . "#846fe4")
	(cyan . "#007a9f")
	(cyan-alt . "#3f709f")
	(cyan-alt-other . "#107f7f")
	(cyan-faint . "#108aaf")
	(cyan-alt-faint . "#3f80af")
	(cyan-alt-other-faint . "#3088af")
	(red-active . "#cd2f44")
	(green-active . "#116a6c")
	(yellow-active . "#993602")
	(blue-active . "#475ccf")
	(magenta-active . "#7f2ccf")
	(cyan-active . "#007a8f")
	(red-nuanced-bg . "#ffdbd0")
	(red-nuanced-fg . "#ed6f74")
	(green-nuanced-bg . "#dcf0dd")
	(green-nuanced-fg . "#3f9a4c")
	(yellow-nuanced-bg . "#fff3aa")
	(yellow-nuanced-fg . "#b47232")
	(blue-nuanced-bg . "#e3e3ff")
	(blue-nuanced-fg . "#201f6f")
	(magenta-nuanced-bg . "#fdd0ff")
	(magenta-nuanced-fg . "#c0527f")
	(cyan-nuanced-bg . "#dbefff")
	(cyan-nuanced-fg . "#0f3f60")
	(bg-diff-heading . "#b7cfe0")
	(fg-diff-heading . "#041645")
	(bg-diff-added . "#d6f0d6")
	(fg-diff-added . "#004520")
	(bg-diff-changed . "#fcefcf")
	(fg-diff-changed . "#524200")
	(bg-diff-removed . "#ffe0ef")
	(fg-diff-removed . "#891626")
	(bg-diff-refine-added . "#84cfa4")
	(fg-diff-refine-added . "#002a00")
	(bg-diff-refine-changed . "#cccf8f")
	(fg-diff-refine-changed . "#302010")
	(bg-diff-refine-removed . "#da92b0")
	(fg-diff-refine-removed . "#500010")
	(bg-diff-focus-added . "#a6e5c6")
	(fg-diff-focus-added . "#002c00")
	(bg-diff-focus-changed . "#ecdfbf")
	(fg-diff-focus-changed . "#392900")
	(bg-diff-focus-removed . "#efbbcf")
	(fg-diff-focus-removed . "#5a0010"))
      modus-themes-vivendi-color-overrides
      '((bg-main . "#25152a")
	(bg-dim . "#2a1930")
	(bg-alt . "#382443")
	(bg-hl-line . "#332650")
	(bg-active . "#463358")
	(bg-inactive . "#2d1f3a")
	(bg-active-accent . "#50308f")
	(bg-region . "#5d4a67")
	(bg-region-accent . "#60509f")
	(bg-region-accent-subtle . "#3f285f")
	(bg-header . "#3a2543")
	(bg-tab-active . "#26162f")
	(bg-tab-inactive . "#362647")
	(bg-tab-inactive-accent . "#36265a")
	(bg-tab-inactive-alt . "#3e2f5a")
	(bg-tab-inactive-alt-accent . "#3e2f6f")
	(fg-main . "#debfe0")
	(fg-dim . "#d0b0da")
	(fg-alt . "#ae85af")
	(fg-unfocused . "#8e7f9f")
	(fg-active . "#cfbfef")
	(fg-inactive . "#b0a0c0")
	(fg-docstring . "#c8d9f7")
	(fg-comment-yellow . "#cf9a70")
	(fg-escape-char-construct . "#ff75aa")
	(fg-escape-char-backslash . "#dbab40")
	(bg-special-cold . "#2a3f58")
	(bg-special-faint-cold . "#1e283f")
	(bg-special-mild . "#0f3f31")
	(bg-special-faint-mild . "#0f281f")
	(bg-special-warm . "#44331f")
	(bg-special-faint-warm . "#372213")
	(bg-special-calm . "#4a314f")
	(bg-special-faint-calm . "#3a223f")
	(fg-special-cold . "#c0b0ff")
	(fg-special-mild . "#bfe0cf")
	(fg-special-warm . "#edc0a6")
	(fg-special-calm . "#ff9fdf")
	(bg-completion . "#502d70")
	(bg-completion-subtle . "#451d65")
	(red . "#ff5f6f")
	(red-alt . "#ff8f6d")
	(red-alt-other . "#ff6f9d")
	(red-faint . "#ffa0a0")
	(red-alt-faint . "#f5aa80")
	(red-alt-other-faint . "#ff9fbf")
	(green . "#51ca5c")
	(green-alt . "#71ca3c")
	(green-alt-other . "#51ca9c")
	(green-faint . "#78bf78")
	(green-alt-faint . "#99b56f")
	(green-alt-other-faint . "#88bf99")
	(yellow . "#f0b262")
	(yellow-alt . "#f0e242")
	(yellow-alt-other . "#d0a272")
	(yellow-faint . "#d2b580")
	(yellow-alt-faint . "#cabf77")
	(yellow-alt-other-faint . "#d0ba95")
	(blue . "#778cff")
	(blue-alt . "#8f90ff")
	(blue-alt-other . "#8380ff")
	(blue-faint . "#82b0ec")
	(blue-alt-faint . "#a0acef")
	(blue-alt-other-faint . "#80b2f0")
	(magenta . "#ff70cf")
	(magenta-alt . "#ff77f0")
	(magenta-alt-other . "#ca7fff")
	(magenta-faint . "#e0b2d6")
	(magenta-alt-faint . "#ef9fe4")
	(magenta-alt-other-faint . "#cfa6ff")
	(cyan . "#30cacf")
	(cyan-alt . "#60caff")
	(cyan-alt-other . "#40b79f")
	(cyan-faint . "#90c4ed")
	(cyan-alt-faint . "#a0bfdf")
	(cyan-alt-other-faint . "#a4d0bb")
	(red-active . "#ff6059")
	(green-active . "#64dc64")
	(yellow-active . "#ffac80")
	(blue-active . "#4fafff")
	(magenta-active . "#cf88ff")
	(cyan-active . "#50d3d0")
	(red-nuanced-bg . "#440a1f")
	(red-nuanced-fg . "#ffcccc")
	(green-nuanced-bg . "#002904")
	(green-nuanced-fg . "#b8e2b8")
	(yellow-nuanced-bg . "#422000")
	(yellow-nuanced-fg . "#dfdfb0")
	(blue-nuanced-bg . "#1f1f5f")
	(blue-nuanced-fg . "#bfd9ff")
	(magenta-nuanced-bg . "#431641")
	(magenta-nuanced-fg . "#e5cfef")
	(cyan-nuanced-bg . "#042f49")
	(cyan-nuanced-fg . "#a8e5e5")
	(bg-diff-heading . "#304466")
	(fg-diff-heading . "#dae7ff")
	(bg-diff-added . "#0a383a")
	(fg-diff-added . "#94ba94")
	(bg-diff-changed . "#2a2000")
	(fg-diff-changed . "#b0ba9f")
	(bg-diff-removed . "#50163f")
	(fg-diff-removed . "#c6adaa")
	(bg-diff-refine-added . "#006a46")
	(fg-diff-refine-added . "#e0f6e0")
	(bg-diff-refine-changed . "#585800")
	(fg-diff-refine-changed . "#ffffcc")
	(bg-diff-refine-removed . "#952838")
	(fg-diff-refine-removed . "#ffd9eb")
	(bg-diff-focus-added . "#1d4c3f")
	(fg-diff-focus-added . "#b4dfb4")
	(bg-diff-focus-changed . "#424200")
	(fg-diff-focus-changed . "#d0daaf")
	(bg-diff-focus-removed . "#6f0f39")
	(fg-diff-focus-removed . "#eebdba"))))

(defun ixnij/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (modus-themes-load-operandi))
    ('dark (modus-themes-load-vivendi))))

(add-hook 'ns-system-appearance-change-functions #'ixnij/apply-theme)

;; Set theme for terminal
(when (not (display-graphic-p))
  (modus-themes-load-vivendi)) ;; dark

(provide 'init-look)

;;; coding: utf-8
;;; init-look.el ends here
