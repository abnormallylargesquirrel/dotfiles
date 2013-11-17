(add-to-list 'load-path "~/.emacs.d")
(require 'popup)
(load "~/.emacs.d/mode-configs.el")

;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)
;(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;(setq viper-mode t)
;(require 'viper)
;(setq viper-want-ctl-h-help t)

(setq visible-bell t)
(setq scroll-step 1)
(global-auto-revert-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'paren)
(show-paren-mode 1)

(column-number-mode 1)
(global-linum-mode 1)

(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(put 'narrow-to-region 'disabled nil)

;;; Emacs/W3 Configuration
(setq load-path (cons "/usr/share/emacs/site-lisp" load-path))
(condition-case () (require 'w3-auto "w3-auto") (error nil))
