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
                '((:java . (:completion (:importOrder '())))))
  (add-hook 'java-mode-hook 'eglot-ensure)
  )

(use-package javadoc-lookup
  :ensure t
  :after ivy)

;; Customize variables (generated)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#880000" "#005500" "#663311" "#004488" "#770077" "#007777" "#eeeecc"])
 '(custom-enabled-themes '(paperi))
 '(custom-safe-themes
   '("569c2773eae611fa683474c31f723677d526e650ec06560dfa8b25f89ca2c270" default))
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
   '(yasnippet-snippets eglot ivy-rich counsel ivy-pass ivy-explorer focus yasnippet yaml-mode use-package treemacs sr-speedbar projectile plan9-theme parchment-theme paper-theme magit javadoc-lookup ivy imenu-list imenu-anywhere gnu-elpa-keyring-update flycheck-inline faff-theme eink-theme brutalist-theme aggressive-indent ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#FAFAFA" :foreground "#070A01" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "CYEL" :family "Iosevka Term")))))
