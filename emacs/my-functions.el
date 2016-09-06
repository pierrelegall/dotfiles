;; * My functions

(defun my/move-line-or-region (arg)
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

(defun my/move-line-or-region-above (arg)
  "Move line or region (if active) above."
  (interactive "*p")
  (my/move-line-or-region (- arg)))

(defun my/move-line-or-region-below (arg)
  "Move line or region (if active) below."
  (interactive "*p")
  (my/move-line-or-region arg))

(defun my/comment-or-uncomment-line-or-region ()
  "Like `comment-or-uncomment-region' but if there is no region selected, the current line is comment or uncomment."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (progn
      (end-of-line)
      (let ((end (point)))
        (beginning-of-line)
        (comment-or-uncomment-region (point) end)))))

(defun my/toggle-letter-case ()
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

(defun my/show-buffer-visiting-file ()
  "Show the absolute path of the current buffer file in the minibuffer."
  (interactive)
  (if (buffer-file-name)
      (message "%s is visiting: %s"
               (buffer-name)
               (propertize (abbreviate-file-name (buffer-file-name))
                           'face '(:foreground "yellow")))
    (message "%s is not linked to a file." (buffer-name))))

(defun my/yank-absolute-buffer-file-path ()
  "Yank the absolute path of the current buffer file."
  (interactive)
  (kill-new (buffer-file-name)))

(defun my/copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun my/kill-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-region (line-beginning-position)
               (line-beginning-position (+ 1 arg)))
  (message "%d line%s killed" arg (if (= 1 arg) "" "s")))

(defun my/copy-region-or-line ()
  "If the region is active and non-empty, call `kill-region'. Otherwise, call `backward-kill-word'."
  (interactive)
  (call-interactively
   (if (use-region-p) 'kill-ring-save 'my/copy-line)))

(defun my/kill-region-or-line ()
  "If the region is active and non-empty, call `kill-region'. Otherwise, call `backward-kill-word'."
  (interactive)
  (call-interactively
   (if (use-region-p) 'kill-region 'my/kill-line)))

(defun my/kill-this-buffer ()
  "Kill the current buffer.
When called in the minibuffer, get out of the minibuffer
using `abort-recursive-edit'."
  (interactive)
  (cond
   ((minibufferp (current-buffer))
    (abort-recursive-edit))
   (t
    (kill-buffer (current-buffer)))))

(defun my/kill-this-buffer-and-delete-file ()
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

(defun my/rename-this-buffer-and-file ()
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

(defun my/scroll-up ()
  (interactive)
  (scroll-up 5))

(defun my/scroll-down ()
  (interactive)
  (scroll-down 5))

(defun my/eshell (&optional arg)
  (interactive "P")
  (if arg
      (eshell arg)
    (eshell-command)))

(defun my/kill-frame ()
  (interactive)
  (if (daemonp)
      (delete-frame)
    (save-buffers-kill-terminal)))

(defun my/ido-recentf-open (&optional ARG)
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (let ((abbreviated-recentf-list (mapcar 'abbreviate-file-name recentf-list)))
       (if (find-file (ido-completing-read "Find recent file: " abbreviated-recentf-list))
           (message "Opening file...")
         (message "Aborting"))))

(defun my/switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(defun my/word-at-position ()
  "Return the word where the cursor is."
  (list (car (bounds-of-thing-at-point 'word))
        (cdr (bounds-of-thing-at-point 'word))))

(defun my/line-at-position ()
  "Return the line where the cursor is."
  (list (car (bounds-of-thing-at-point 'line))
        (cdr (bounds-of-thing-at-point 'line))))

(defun my/word-at-position-or-region ()
  "Return the word where the cursor is or the region
if a region currently selected."
  (if (use-region-p)
      (list (region-beginning) (region-end))
    (my/string-at-position)))

(defun my/line-at-position-or-region ()
  "Return the line where the cursor is or the region
if a region currently selected."
  (if (use-region-p)
      (list (region-beginning) (region-end))
    (my/line-at-position)))

(defun my/region-content ()
  "Return the content of the region."
  (buffer-substring (region-beginning) (region-end)))

(defun my/translate ()
  "Open WordReference web browser to translate a word."
  (interactive)
  (let* ((website "http://www.wordreference.com")
         (word (if (use-region-p) (my/region-content) (read-string "Word: ")))
         (type (read-string (format "Translate «%s» from ? to ?: " word) "enfr")))
    (browse-url-generic (concat website "/" type "/" (url-hexify-string word))))
  (message "Opened in your web browser."))

(defun my/load-file-relative (file-name)
  "Load file relatively. The base directory is the current file directory."
  (load-file (concat
              (file-name-directory (or load-file-name buffer-file-name))
              file-name)))

(defun my/kill-line-or-region (beg end &optional region)
  "Kill line or the region if active."
  (interactive (list (mark) (point) 'region))
  (if (region-active-p)
      (kill-region beg end region)
    (kill-line)))

(defun my/other-window (jump)
  "Go to another window skipping the minibuffer."
  (interactive "p")
  (other-window jump)
  (if (minibufferp (current-buffer))
      (if (< jump 0)
          (my/previous-window)
        (my/next-window))))

(defun my/next-window ()
  "Go to the next non-minibuffer window."
  (interactive)
  (my/other-window 1))

(defun my/previous-window ()
  "Go to the next non-minibuffer window."
  (interactive)
  (my/other-window -1))

(defun my/rename-buffer ()
  "Interative buffer renaming with pre-filled default name."
  (interactive)
  (let ((new-name
         (read-string "Rename buffer: "
                      (buffer-name))))
    (rename-buffer new-name)))
