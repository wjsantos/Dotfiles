
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; helm 
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-c C-f" . helm-find-files)
	 ("C-c C-b" . helm-buffers-list)))
(set-default 'helm-mode-fuzzy-match t)

;; evil mode
(use-package evil
  :ensure t
  :config (evil-mode 1))

;; ruby
(use-package ruby-mode
  :ensure t)

;; rspec
(use-package rspec-mode
  :ensure t)

;; inf-ruby for rspec binding pry
(use-package inf-ruby
  :ensure t)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; magit
(use-package magit
  :ensure t
  :bind (("C-c C-m" . magit-status))
  :config (magit-mode))

;; config
(set-default 'truncate-lines t)
(global-linum-mode t) 
(setq vc-follow-symlinks nil)

;; themes
(setq custom-safe-themes t)
(load-theme 'solarized-dark t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (inf-ruby yaml-mode use-package solarized-theme rspec-mode powerline-evil neotree markdown-preview-mode magit helm-projectile helm-ls-git dracula-theme color-theme-solarized afternoon-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
