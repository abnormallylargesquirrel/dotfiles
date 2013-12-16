;; Type break
(type-break-mode 1)

;; Slime
(setq inferior-lisp-program "/usr/bin/sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; Undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; Evil
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd ",,") 'evil-repeat-find-char-reverse)
(global-set-key (kbd "<f7>") 'evil-mode)

;; Key-chord
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jl" 'evil-normal-state)

;; Expand-Region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Ace-Jump
(require 'ace-jump-mode)
;(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)
(global-set-key (kbd "<f8>") 'ace-jump-char-mode)

;; Auto-Complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")

(add-to-list 'ac-modes 'lisp-mode)
;(ac-set-trigger-key "TAB")

;; Terminal
(global-set-key (kbd "C-c t") 'jump-to-terminal)
;(global-set-key (kbd "C-c t") 'jump-to-shell)

;; C mode
(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
;  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4))
;  (company-mode)
;  (setq c-indent-level 4)
;  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
;  (setq tab-width 4)
;  (setq indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-go-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4))

(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Go mode
(require 'go-mode)
