(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/expand-region")
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/undo-tree")

(load-library "modes")
(load-library "efuncs")

(require 'popup)
(require 'go-mode)

(setq visible-bell t)

;(setq scroll-step 1)
;(setq scroll-conservatively 10000)
;(setq scroll-margin 1
;(setq scroll-step 1
;      scroll-conservatively 2000
;      scroll-up-aggressively 0.01
;      scroll-down-aggressively 0.01)
;(setq-default scroll-up-aggressively 0.01
;	      scroll-down-aggressively 0.01)

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq sentence-end-double-space nil)

(tool-bar-mode 0)
(menu-bar-mode 0)

(require 'paren)
(show-paren-mode 1)

(require 'ido)
(ido-mode t)

;(require 'smooth-scroll)
;(smooth-scroll-mode t)

(column-number-mode 1)
(global-linum-mode 0)

(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

(setq vc-make-backup-files t)

(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(put 'narrow-to-region 'disabled nil)
