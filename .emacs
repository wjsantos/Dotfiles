
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-c C-f" . helm-find-files)
	 ("C-c C-b" . helm-buffers-list)))

(use-package evil
  :ensure t
  :config (evil-mode 1)))


(use-package projectile
  :ensure t
  :config (projectile-mode))
  
