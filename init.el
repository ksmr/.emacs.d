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

;; Ocaml development

(use-package tuareg
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu))

(use-package merlin
  :ensure t
  :after tuareg
  :config
  (add-hook 'tuareg-mode-hook 'merlin-mode)
  (setq merlin-use-auto-complete-mode t)
  (setq merlin-error-after-save nil))

(use-package utop
  :ensure t
  :after tuareg
  :config
  (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
  (dolist
      (var (car (read-from-string
                 (shell-command-to-string "opam config env --sexp"))))
    (setenv (car var) (cadr var)))
  ;; Update the emacs path
  (setq exec-path (split-string (getenv "PATH") path-separator))
  ;; Update the emacs load path
  (push (concat (getenv "OCAML_TOPLEVEL_PATH")
                "/../../share/emacs/site-lisp") load-path))




;; Customize variables (generated)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ad-java-bytecode-parameters '("-c" "-private" "-verbose"))
 '(ansi-color-names-vector
   ["#000000" "#880000" "#005500" "#663311" "#004488" "#770077" "#007777" "#eeeecc"])
 '(ansi-term-color-vector
   [unspecified "#282828" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#83a598" "#d5c4a1"])
 '(custom-enabled-themes '(paperi))
 '(custom-safe-themes
   '("4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "30a733e0b23c0df7040ee717707fe15e42b1dd0fbc4c5d4f98502c274ccf15ee" "569c2773eae611fa683474c31f723677d526e650ec06560dfa8b25f89ca2c270" default))
 '(eglot-autoshutdown t)
 '(eglot-put-doc-in-help-buffer t)
 '(eglot-send-changes-idle-time 0)
 '(ivy-mode t)
 '(javadoc-lookup-completing-read-function 'ivy-completing-read)
 '(org-drill-done-count-color "#663311")
 '(org-drill-failed-count-color "#880000")
 '(org-drill-mature-count-color "#005500")
 '(org-drill-new-count-color "#004488")
 '(package-selected-packages
   '(nix-mode visual-regexp autodisass-java-bytecode kotlin-mode dune merlin utop tuareg dired-subtree cider oauth2 base16-theme modus-operandi-theme yasnippet-snippets eglot ivy-rich counsel ivy-pass ivy-explorer focus yasnippet yaml-mode use-package treemacs sr-speedbar projectile plan9-theme parchment-theme paper-theme magit javadoc-lookup ivy imenu-list imenu-anywhere gnu-elpa-keyring-update flycheck-inline faff-theme eink-theme brutalist-theme aggressive-indent ace-jump-mode))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#FAFAFA" :foreground "#070A01" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "CYEL" :family "Iosevka Term")))))
