;; Visual edits
(menu-bar-mode -1) ; remove menu bar
(tool-bar-mode -1) ; remove tool bar
(scroll-bar-mode -1) ; remove all scroll bars
(set-fringe-mode 10) ; add some padding to the left
(add-to-list 'default-frame-alist
             '(font . "Dina-10")) ; set font
(global-display-line-numbers-mode 1) ; line numbers
(setq use-dialog-box nil) ; no dialog boxes -- ever

;; Package management

; set package repos, we do not use package.el to install
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

; get use-package for package-install
(require 'use-package)
(unless package-archive-contents
  (package-refresh-contents))

(setq use-package-always-ensure t) ; Attempts downloading packages if not installed

;; Package list

(use-package magit :defer) ; Amazing git porcelain
(use-package color-theme-sanityinc-tomorrow) ; My theme, not set by default intentionally
(use-package color-theme-sanityinc-solarized)
(use-package org
  :config
  (setq org-agenda-files
	'("~/Notes/assign.org"    ; assignments
	  "~/Notes/events.org"    ; events on campus
	  "~/Notes/schedule.org"  ; recurring classes, etc.
	  "~/Notes/daily.org")))   ; daily tasks
(use-package vertico
  :init (vertico-mode)) ; Better search completion (lightweight!)

(use-package eglot
  :config (add-hook 'c-ts-mode-hook 'eglot-ensure))

;; Uncomment to enable completion
(use-package company
  :config (add-hook 'after-init-hook 'global-company-mode))



;; Tree-sitter parser support
(setq treesit-language-source-alist
      '((c "https://github.com/tree-sitter/tree-sitter-c")
	(cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	(elisp "https://github.com/wilfred/tree-sitter-elisp")
	(make "https://github.com/alemuller/tree-sitter-make")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(org "https://github.com/milisims/tree-sitter-org")
	(latex "https://github.com/latex-lsp/tree-sitter-latex")))
;; Unfortunately, only a fraction of these are supported by emacs
(setq major-mode-remap-alist
      '((c-mode . c-ts-mode)))

;; Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(sanityinc-solarized-light))
 '(custom-safe-themes
   '("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4"
     "76ddb2e196c6ba8f380c23d169cf2c8f561fd2013ad54b987c516d3cabc00216"
     "b11edd2e0f97a0a7d5e66a9b82091b44431401ac394478beb44389cf54e6db28"
     "6bdc4e5f585bb4a500ea38f563ecf126570b9ab3be0598bdf607034bb07a8875"
     "04aa1c3ccaee1cc2b93b246c6fbcd597f7e6832a97aaeac7e5891e6863236f9f"
     "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1"
     "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd"
     "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d"
     default))
 '(package-selected-packages
   '(color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow
				     company magit vertico)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
