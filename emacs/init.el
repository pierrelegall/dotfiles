;;;;
;;;; Emacs configuration file
;;;;

;;;; Package init

(package-initialize)

;;;; Global window

(menu-bar-mode -1)
(if (window-system)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;;;; Navigation

(setq scroll-margin 2)
(setq scroll-step 2)
(setq mouse-wheel-follow-mouse (quote t))
(setq mouse-wheel-mode t)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount (quote (2 ((shift) . 1))))
(setq shift-select-mode nil)

;;;; Behavior

(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default message-log-max nil)
(delete-selection-mode 1)
(show-paren-mode 1)
(global-visual-line-mode 1)
(global-auto-complete-mode)

;;;; Minibuffer

(setq line-number-mode 1)
(setq column-number-mode 1)
(setq read-file-name-completion-ignore-case t)

(let ((map minibuffer-local-map))
  (define-key map (kbd "C-p") 'previous-history-element)
  (define-key map (kbd "C-n") 'next-history-element))

(let ((map isearch-mode-map))
  (define-key map (kbd "C-h") 'isearch-delete-char)
  (define-key map (kbd "C-S-h") 'isearch-delete-char))

;;;; Global keymap

(defvar my-global-map (make-keymap) "my global map")
(define-minor-mode my-global-map-mode "my global map" :keymap my-global-map)
(setq-default my-global-map-mode 1)

(let ((map my-global-map))
  (define-key map (kbd "C-w") 'kill-region-or-backward-word)
  (define-key map (kbd "C-S-w") 'kill-ring-save)
  (define-key map (kbd "C-S-y") 'yank-pop)
  (define-key map (kbd "C-x C-k") 'kill-this-buffer)
  (define-key map (kbd "C-c C-k") 'kill-this-buffer-and-delete-file)
  (define-key map (kbd "C-%") 'query-replace)

  (define-key map (kbd "C-h") 'backward-delete-char-untabify)
  (define-key map (kbd "C-S-h") 'backward-kill-word)
  (define-key map (kbd "C-S-d") 'kill-word)

  (define-key map (kbd "C-!") 'bash-mode)
  (define-key map (kbd "C-`") 'rename-buffer)

  (define-key map (kbd "C-,") 'backward-word)
  (define-key map (kbd "C-.") 'forward-word)
  (define-key map (kbd "C-S-b") 'backward-word)
  (define-key map (kbd "C-S-f") 'forward-word)
  (define-key map (kbd "C-<") 'beginning-of-buffer)
  (define-key map (kbd "C->") 'end-of-buffer)

  (define-key map (kbd "<C-tab>") 'next-buffer)
  (define-key map (kbd "<C-iso-lefttab>") 'previous-buffer)

  (define-key map (kbd "C-S-l") 'goto-line)

  (define-key map (kbd "C-;") 'comment-or-uncomment-line-or-region)

  (define-key map (kbd "C-/") 'undo)
  (define-key map (kbd "C-\\") 'redo)

  ;;(define-key map (kbd "C-/") 'toggle-letter-case)

  (define-key map (kbd "C-o")
    (lambda() (interactive) (other-window 1)))
  (define-key map (kbd "C-S-o")
    (lambda() (interactive) (other-window -1)))
  (define-key map (kbd "C-x o")
    (lambda() (interactive) (other-window 1)))
  (define-key map (kbd "C-x O")
    (lambda() (interactive) (other-window -1)))

  (define-key map (kbd "<M-up>") 'move-line-or-region-above)
  (define-key map (kbd "<M-down>") 'move-line-or-region-below)

  (define-key map (kbd "C-c a") 'org-agenda)
  (define-key map (kbd "C-c l") 'org-store-link)

  (define-key map (kbd "C-c s") 'magit-status)

  (define-key map [C-f1] 'show-absolute-buffer-file-path))

;;;; Clipboard

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;;; Redo

(require 'redo+)

;;;; Formating style

(setq c-default-style "linux")
(setq c-basic-offset 2)
(setq js-indent-level 2)

;;;; Files and backups

(setq auto-save-default nil)
(setq backup-inhibited t)
(setq make-backup-files nil)

;;;; Org

(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "|" "DONE")))
(setq org-agenda-files '("~/Notes/Organizer/"))
(setq org-hide-leading-stars t)

;;;; Ido

(require 'ido)
(ido-mode t)
;;(ido-mode 'buffers) ;; only use this line to turn off ido for file names!
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
                           "*Messages*" "Async Shell Command"))

;;;; Packages

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;;; Theme and faces

(load-theme 'deeper-blue t)

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
      (let ((bds (bounds-of-thing-at-point 'word)))
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
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun bash-mode ()
  "Run an ansi-term with bash in the current buffer."
  (interactive)
  (ansi-term "/bin/bash" nil))

;;;; Hooks

(add-hook 'emacs-startup-hook
          (lambda ()
            (kill-buffer "*Messages*")))

(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))
