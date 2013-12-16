(defun kill-daemon ()
  (interactive)
  (progn
    (setq kill-emacs-hook 'nil)
    (kill-emacs)))

(defun jump-to-terminal ()
  "go to *ansi-term* buffer if it exists"
  (interactive)
  (let ((buffer-name "*ansi-term*"))
    (if (get-buffer buffer-name)
	(pop-to-buffer buffer-name)
	(ansi-term "/bin/bash"))))

(defun jump-to-shell ()
  "go to *shell* buffer if it exists"
  (interactive)
  (let ((buffer-name "*shell*"))
    (if (get-buffer buffer-name)
	(pop-to-buffer buffer-name)
	(shell))))

(defun rename-file-and-buffer (new-name)
  "Renames current buffer and the file it's visiting to NEW-NAME"
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file" name)
	(if (get-buffer new-name)
	    (message "A buffer named '%s' already exists" new-name)
	    (progn (rename-file name new-name 1)
		   (rename-buffer new-name)
		   (set-visited-file-name new-name)
		   (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR"
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file" name)
	(progn
	  (copy-file filename newname 1)
	  (delete-file filename)
	  (set-visited-file-name newname)
	  (set-buffer-modified-p nil)))))

(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily while prompting for line number input"
  (interactive)
  (unwind-protect
       (progn
	 (linum-mode 1)
	 (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;(defun dired-back-to-top ()
;  (interactive)
;  (beginning-of-buffer)
;  (dired-next-line 4))
;
;(define-key dired-mode-map
;    (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
;
;(defun dired-jump-to-bottom ()
;  (interactive)
;  (end-of-buffer)
;  (dired-next-line -1))
;
;(define-key dired-mode-map
;    (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

(eval-after-load "dired"
  '(progn
    (define-key dired-mode-map "F" 'my-dired-find-file)
    (defun my-dired-find-file (&optional arg)
      "Open each of the marked files or the file under the point or when prefixed with N, next N files"
      (interactive "P")
      (let* ((fn-list (dired-get-marked-files nil arg)))
	(mapc 'find-file fn-list)))))

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(defun iwb-tabs ()
  "indent whole buffer"
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)))

(defun create-c-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command 
   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))
