;; enable relative numbers
(setq display-line-numbers-type 'relative)

;; enable line numbers
(global-display-line-numbers-mode t)

;; load built-in dark theme
(load-theme 'wombat t)

;; font
(set-face-attribute 'default nil :height 250) ;; ~25pt

;; transparent
; (set-frame-parameter (selected-frame) 'alpha '(90 . 90))
; (add-to-list 'default-frame-alist '(alpha . (90 . 90)))

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
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(company-box company lsp-ui lsp-mode go-mode helm counsel ivy consult orderless vertico corfu evil-commentary evil-surround evil-collection evil)))
(custom-set-faces
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

