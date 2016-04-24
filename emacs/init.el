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

;;;; Global keymap

(defvar my-global-map (make-keymap) "my global map")
(define-minor-mode my-global-map-mode "my global map" :keymap my-global-map)
(setq-default my-global-map-mode 1)

(let ((map my-global-map))
  (define-key map (kbd "C-?") 'help-command)
  (define-key map (kbd "C-x C-h") 'help-command)

  (define-key map (kbd "C-w") 'kill-region-or-backward-word)
  (define-key map (kbd "C-S-w") 'kill-ring-save)
  (define-key map (kbd "C-S-y") 'yank-pop)
  (define-key map (kbd "C-x C-k") 'kill-this-buffer)
  (define-key map (kbd "C-c C-k") 'kill-this-buffer-and-delete-file)
  (define-key map (kbd "C-%") 'query-replace)

  (define-key map (kbd "C-h") (kbd "<backspace>"))
  (define-key map (kbd "C-S-h") (kbd "C-<backspace>"))
  (define-key map (kbd "C-S-d") 'kill-word)

  (define-key map (kbd "C-v") 'my-scroll-up)
  (define-key map (kbd "M-v") 'my-scroll-down)
  (define-key map (kbd "C-S-v") 'my-scroll-down)

  (define-key map (kbd "C-;") 'execute-extended-command)
  (define-key map (kbd "C-:") 'shell-command)
  (define-key map (kbd "C-!") 'eshell-command)
  (define-key map (kbd "C-`") 'rename-buffer)
  (define-key map (kbd "C-c C-t") 'multi-term)
  (define-key map (kbd "C-c t") 'multi-term-next)

  (define-key map (kbd "C-'") 'select-by-step)
  (define-key map (kbd "C-j") 'toggle-letter-case)

  (define-key map (kbd "C-,") 'backward-word)
  (define-key map (kbd "C-.") 'forward-word)
  (define-key map (kbd "C-S-b") 'backward-word)
  (define-key map (kbd "C-S-f") 'forward-word)
  (define-key map (kbd "C-<") 'beginning-of-buffer)
  (define-key map (kbd "C->") 'end-of-buffer)

  (define-key map (kbd "<C-tab>") 'next-buffer)
  (define-key map (kbd "<C-iso-lefttab>") 'previous-buffer)

  (define-key map (kbd "C-S-l") 'goto-line)

  (define-key map (kbd "C-;") 'execute-extended-command)
  (define-key map (kbd "C-#") 'comment-or-uncomment-line-or-region)

  (define-key map (kbd "C-/") 'undo)
  (define-key map (kbd "C-\\") 'redo)
  (define-key map (kbd "C-S-r") 'revert-buffer)

  (define-key map (kbd "C-o")
    (lambda() (interactive) (other-window 1)))
  (define-key map (kbd "C-S-o")
    (lambda() (interactive) (other-window -1)))
  (define-key map (kbd "C-x o")
    (lambda() (interactive) (other-window 1)))
  (define-key map (kbd "C-x O")
    (lambda() (interactive) (other-window -1)))

  (define-key map (kbd "C-S-p") 'move-line-or-region-above)
  (define-key map (kbd "C-S-n") 'move-line-or-region-below)

  (define-key map (kbd "C-c a") 'org-agenda)
  (define-key map (kbd "C-c l") 'org-store-link)

  (define-key map (kbd "C-c s") 'magit-status)

  (define-key map [C-f1] 'show-absolute-buffer-file-path))

;;;; Redo

(require 'redo+)

;;;; Formating style

(setq c-default-style "linux")
(setq c-basic-offset 2)
(setq js-indent-level 2)

;;;; Saving and backups

(setq auto-save-default nil)
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs-backups")))

;;;; Dired

(require 'dired)
(setq dired-listing-switches "--group-directories-first -Alh --indicator-style=slash")
(define-key dired-mode-map (kbd "C-m") 'dired-find-alternate-file)

;;;; Yascroll

(setq yascroll:scroll-bar '(left-fringe right-fringe text-area))
(setq yascroll:delay-to-hide 1)
(global-yascroll-bar-mode t)

;;;; Eshell

(setq eshell-cmpl-ignore-case t)
(setq eshell-banner-message ";; Welcome to the Emacs shell\n")
(setq eshell-prompt-regexp "[#$] ")
(setq eshell-prompt-function
  (lambda ()
    (concat
     (propertize "\n")
     (propertize "[" 'face `(:foreground "dodger blue" :weight bold))
     (propertize (user-login-name) 'face `(:foreground "#d23681" :weight bold))
     (propertize "@" 'face `(:foreground "dodger blue" :weight bold))
     (propertize (system-name) 'face `(:foreground "#d23681" :weight bold))
     (propertize " ")
     (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground "#2aa097" :weight bold))
     (propertize "]" 'face `(:foreground "dodger blue" :weight bold))
     (propertize "\n")
     (if (= (user-uid) 0)
         (propertize "#" 'face `(:foreground "orange red"))
       (propertize "$" 'face `(:foreground "medium sea green" :weight bold)))
     (propertize " "))))

;;;; Org

(let ((map my-global-map))
  (define-key map (kbd "<M-up>") 'org-move-subtree-up)
  (define-key map (kbd "<M-down>") 'org-move-subtree-down))

(setq org-agenda-files '("~/Documents/Organizer/"))
(setq org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)")))
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-list-sublevels nil)

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex $(basename %b)"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))

;;;; Ido

(require 'ido)
(ido-mode t)
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
                           "*Messages*" "Async Shell Command"))

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


