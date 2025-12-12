;; Enable server mode (daemon) for this Emacs session
(server-start)

;; enable relative numbers
(setq display-line-numbers-type 'relative)
; (global-display-line-numbers-mode +1)

;; enable line numbers
(global-display-line-numbers-mode t)

;; font
(set-face-attribute 'default nil :height 250) ;; ~25pt

;; transparent
(set-frame-parameter (selected-frame) 'alpha '(80 . 80))
(add-to-list 'default-frame-alist '(alpha . (80 . 80)))

;; ------------------------
;; package / use-package bootstrap
;; ------------------------
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Ensure package list is available
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if missing
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ;; auto-install packages

;; basic UI niceties (keep it plain)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq evil-want-keybinding nil)

;; Evil (vim emulation)
;; allow C-u to scroll
(setq evil-undo-system 'undo-redo)
(setq evil-want-C-u-scroll t)
(use-package evil
  :init
  (setq evil-want-integration t)
  :config
  (evil-mode 1))

;; optional: make many Emacs packages play well with Evil
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; useful small packages
(use-package evil-surround  ;; change/delete surrounding chars like vim-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary  ;; gc to comment like vim-commentary
  :config
  (evil-commentary-mode))

;; recommended ergonomic defaults
(setq-default indent-tabs-mode nil) ;; use spaces
(setq tab-width 4)

;; basic key tweaks (example)
(define-key evil-normal-state-map (kbd "SPC") nil) ;; free SPC for keymap
;; Example: make jk exit insert mode quickly
; (with-eval-after-load 'evil
;   (define-key evil-insert-state-map (kbd "j k") 'evil-normal-state))

;; package auto-upgrades
;; (use-package auto-package-update
;;   :config
;;   (setq auto-package-update-interval 7) ; weekly
;;   (auto-package-update-maybe))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("377bf88f6a5c5085bccdd96beeade170a55df7944e9768f1108ada15d4e71e02" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176" "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9" default))
 '(helm-minibuffer-history-key "M-p")
 '(org-agenda-files '("/home/lukas/studi/sem3/readme.org"))
 '(package-selected-packages
   '(org-bullets org-modern autumn-light-theme gruvbox-theme org-fragtog ob-go company-box company lsp-ui lsp-mode go-mode helm counsel ivy consult orderless vertico corfu evil-commentary evil-surround evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)

(use-package corfu
  :init
  (global-corfu-mode)) ;; enable globally

;; Optional: TAB to complete, auto-popup, etc.
(setq corfu-auto t)        ;; enable auto completion popup
(setq corfu-cycle t)       ;; allow cycling through candidates

(use-package ivy
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper))) ;; better search

;; Go major mode
(use-package go-mode
  :mode "\\.go\\'")

;; LSP
(use-package eglot
  :hook ((go-mode c-mode c++-mode) . eglot-ensure)
  :config
  ;; Tell eglot which servers to use
  (add-to-list 'eglot-server-programs
               '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd"))))

;; Completion
(use-package company
  :hook (after-init . global-company-mode))

;; path stuff
(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

;; execute code blocks in org-mode
(use-package ob-go
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((go . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t))))

(setq org-babel-default-header-args:python
      '((:results . "output"))) ;print output when exec python

(setq org-babel-default-header-args:C
      '((:results . "output"))) ;print output when exec python

(global-set-key (kbd "C-a") 'org-agenda)

(global-set-key (kbd "C-c l") 'org-latex-preview) ;cool new short-cut

(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 2.5)) ;bigger latex preview

(setq org-startup-with-latex-preview t) ;latex preview as default

(use-package org-fragtog ;latex text on hover
  :hook (org-mode . org-fragtog-mode))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-medium t))

(blink-cursor-mode -1)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

