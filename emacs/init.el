;; * Emacs configuration entry point

(defvar my/init-files-directory
  (concat (getenv "HOME") "/.config/emacs/init-files")
  "Directory of the initialization files.")

(defvar my/init-files
  (directory-files my/init-files-directory t "^[^.]")
  "List of the initialization files.")

(defun my/load-init-files ()
  "Load all the initialization files."
  (mapcar (lambda (init-file)
            (load-file init-file))
          my/init-files))

(package-initialize)
(my/load-init-files)

;;;; Packages

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;;; Functions

(defun move-line-or-region (arg)
  "Move region (transient-mark-mode active) or current line arg lines up if positive, down if negative."
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg)
          (when (and (eval-when-compile
                       '(and (>= emacs-major-version 24)
                             (>= emacs-minor-version 3)))
                     (< arg 0))
            (forward-line -1)))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-line-or-region-above (arg)
  "Move line or region (if active) above."
  (interactive "*p")
  (move-line-or-region (- arg)))

(defun move-line-or-region-below (arg)
  "Move line or region (if active) below."
  (interactive "*p")
  (move-line-or-region arg))

(defun comment-or-uncomment-line-or-region ()
  "Like `comment-or-uncomment-region' but if there is no region selected, the current line is comment or uncomment."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (progn
      (end-of-line)
      (let ((end (point)))
        (beginning-of-line)
        (comment-or-uncomment-region (point) end)))))

(defun semantic-unit (arg)
  "Go to the next semantic unit if arg is positive or to the previous one if negative."
  (interactive "p")
  (when (nth 3 (syntax-ppss))
    (if (> arg 0)
        (progn
          (skip-syntax-forward "^\"")
          (goto-char (1+ (point)))
          (decf arg))
      (skip-syntax-backward "^\"")
      (goto-char (1- (point)))
      (incf arg)))
  (up-list arg))

(defun select-by-step (arg &optional incremental)
  "Select the current word. Subsequent calls expands the selection to larger semantic unit."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (or (and transient-mark-mode mark-active)
                         (eq last-command this-command))))
  (if incremental
      (progn
        (semantic-unit (- arg))
        (forward-sexp)
        (mark-sexp -1))
    (if (> arg 1)
        (extend-selection (1- arg) t)
      (if (looking-at "\\=\\(\\s_\\|\\sw\\)*\\_>")
          (goto-char (match-end 0))
        (unless (memq (char-before) '(?\) ?\"))
          (forward-sexp)))
      (mark-sexp -1))))

(defun toggle-letter-case ()
  "Toggle the letter case of current word or text selection. Toggles between: “all lower”, “Init Caps”, “ALL CAPS”."
  (interactive)
  (let (p1 p2 (deactivate-mark nil) (case-fold-search nil))
    (if (use-region-p)
        (setq p1 (region-beginning) p2 (region-end))
      (let ((bds (bounds-of-thing-at-point 'symbol)))
        (setq p1 (car bds) p2 (cdr bds))))
    (when (not (eq last-command this-command))
      (save-excursion
        (goto-char p1)
        (cond
         ((looking-at "[[:lower:]][[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]][[:upper:]]") (put this-command 'state "all caps"))
         ((looking-at "[[:upper:]][[:lower:]]") (put this-command 'state "init caps"))
         ((looking-at "[[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]]") (put this-command 'state "all caps"))
         (t (put this-command 'state "all lower")))))
    (cond
     ((string= "all lower" (get this-command 'state))
      (upcase-initials-region p1 p2) (put this-command 'state "init caps"))
     ((string= "init caps" (get this-command 'state))
      (upcase-region p1 p2) (put this-command 'state "all caps"))
     ((string= "all caps" (get this-command 'state))
      (downcase-region p1 p2) (put this-command 'state "all lower")))))

(defun show-absolute-buffer-file-path ()
  "Show the absolute path of the current buffer file in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(defun yank-absolute-buffer-file-path ()
  "Yank the absolute path of the current buffer file."
  (interactive)
  (kill-new (buffer-file-name)))

(defun kill-region-or-backward-word ()
  "If the region is active and non-empty, call `kill-region'. Otherwise, call `backward-kill-word'."
  (interactive)
  (call-interactively
   (if (use-region-p) 'kill-region 'backward-kill-word)))

(defun kill-this-buffer-and-delete-file ()
  "Kill the current buffer and file it is visiting file."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (cond
         ((vc-backend filename) (vc-delete-file filename))
         (t
          (delete-file filename t)
          (kill-buffer buffer)
          (message "File '%s' successfully removed." filename)))))))

(defun rename-this-buffer-and-file ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)
          (message "File '%s' successfully moved." filename)))))))

(defun my-scroll-up ()
  (interactive)
  (scroll-up 8))

(defun my-scroll-down ()
  (interactive)
  (scroll-down 8))


