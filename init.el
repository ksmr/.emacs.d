;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-startup-screen t)
(setq backup-directory-alist `(("." . "~/.saves")))

;; Don't leave trailing whitespace hanging
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Don't use tabs, ever
(setq-default indent-tabs-mode nil)

(require 'cc-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(package-refresh-contents)

(require 'use-package)

;; Better completion

(use-package ivy
  :ensure t
  :config (ivy-mode))

(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

;; Generally useful stuff for working on projects

(use-package magit
  :ensure t)

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  :config
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (global-company-mode))

(use-package projectile
  :ensure t
  :after ivy
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package counsel-projectile
  :after projectile
  :ensure t
  :config (counsel-projectile-mode))

(use-package yasnippet
  :ensure t)

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package direnv
  :config (direnv-mode))

;; Java development

(use-package eglot
  :ensure t
  :config
  (setq-default eglot-workspace-configuration
                '((:java . (:completion (:importOrder '[""])))))
  (add-hook 'java-mode-hook 'eglot-ensure)
  )

(use-package javadoc-lookup
  :ensure t
  :after ivy)

;; Haskell development

(use-package haskell-mode
  :ensure t)

(use-package attrap
  :ensure t)

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))

;; Rust development

(use-package racer
  :ensure t
  :config
  (setq racer-rust-src-path nil)
  (setq racer-cmd "racer")
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

;; Customize variables (generated)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ad-java-bytecode-parameters '("-c" "-private" "-verbose"))
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#880000" "#005500" "#663311" "#004488" "#770077" "#007777" "#eeeecc"])
 '(ansi-term-color-vector
   [unspecified "#282828" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#83a598" "#d5c4a1"] t)
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(modus-operandi))
 '(custom-safe-themes
   '("57611cca8f9ef308a64c3ef64a731478426d5422226aa509816e84a755a0441b" "87fd15a92096797894626d25d8f8a436b90ce8d97d499a98faea972944645fbd" "dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" "82af18870ab550caad9a2c7a9a139106ec6fd51b640733d39879d0452f66fb9f" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "30a733e0b23c0df7040ee717707fe15e42b1dd0fbc4c5d4f98502c274ccf15ee" "569c2773eae611fa683474c31f723677d526e650ec06560dfa8b25f89ca2c270" default))
 '(eglot-autoshutdown t)
 '(eglot-put-doc-in-help-buffer t)
 '(eglot-send-changes-idle-time 0)
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(highlight-tail-colors '(("#aecf90" . 0) ("#c0efff" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#714900")
     ("TODO" . "#721045")
     ("NEXT" . "#5317ac")
     ("THEM" . "#8f0075")
     ("PROG" . "#005589")
     ("OKAY" . "#185870")
     ("DONT" . "#4a5700")
     ("FAIL" . "#a80000")
     ("DONE" . "#005200")
     ("NOTE" . "#804000")
     ("KLUDGE" . "#8b3800")
     ("HACK" . "#8b3800")
     ("TEMP" . "#4d0006")
     ("FIXME" . "#9d2020")
     ("XXX+" . "#880000")
     ("REVIEW" . "#005a68")
     ("DEPRECATED" . "#001170")))
 '(ibuffer-deletion-face 'dired-flagged)
 '(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
 '(ibuffer-marked-face 'dired-marked)
 '(ibuffer-title-face 'modus-theme-header)
 '(ivy-mode t)
 '(javadoc-lookup-completing-read-function 'ivy-completing-read)
 '(org-drill-done-count-color "#663311")
 '(org-drill-failed-count-color "#880000")
 '(org-drill-mature-count-color "#005500")
 '(org-drill-new-count-color "#004488")
 '(package-selected-packages
   '(modus-vivendi-theme dracula-theme racer direnv rust-mode rfc-mode ggtags dante attrap haskell-mode nix-mode visual-regexp autodisass-java-bytecode kotlin-mode dune merlin utop tuareg dired-subtree cider oauth2 base16-theme modus-operandi-theme yasnippet-snippets eglot ivy-rich counsel ivy-pass ivy-explorer focus yasnippet yaml-mode use-package treemacs sr-speedbar projectile plan9-theme parchment-theme paper-theme magit javadoc-lookup ivy imenu-list imenu-anywhere gnu-elpa-keyring-update flycheck-inline faff-theme eink-theme brutalist-theme aggressive-indent ace-jump-mode))
 '(show-paren-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#a80000")
     (40 . "#721045")
     (60 . "#8f0075")
     (80 . "#880000")
     (100 . "#8b3800")
     (120 . "#714900")
     (140 . "#5d3026")
     (160 . "#184034")
     (180 . "#005200")
     (200 . "#4a5700")
     (220 . "#005a68")
     (240 . "#185870")
     (260 . "#005589")
     (280 . "#093060")
     (300 . "#0030a6")
     (320 . "#223fbf")
     (340 . "#0000bb")
     (360 . "#5317ac")))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
   ["#000000" "#a80000" "#005200" "#8b3800" "#0030a6" "#721045" "#005589" "#f3f1f3"])
 '(xterm-color-names-bright
   ["#505050" "#880000" "#4a5700" "#714900" "#223fbf" "#8f0075" "#185870" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :width extra-condensed :family "Iosevka Term")))))
