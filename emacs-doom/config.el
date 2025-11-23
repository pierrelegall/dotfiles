;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Do not auto-initialize
(setq package-enable-at-startup nil)

;; Do not add that `custom-set-variables' block to my init.el
(setq package--init-file-ensured t)

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(pixel-scroll-precision-mode)
(window-divider-mode)

(setq window-divider-default-right-width 8)
(setq window-divider-default-bottom-width 8)
;; (setq-default mode-line-format nil)

(set-frame-parameter nil 'alpha-background 100)
(add-to-list 'default-frame-alist '(alpha-background . 100))

(setq-default cursor-type 'box)
(blink-cursor-mode t)
(setq blink-cursor-interval 0.1)
(setq blink-cursor-blinks 2)
(setq blink-cursor-delay 0.25)
(setq show-paren-delay 0.05)
(setq show-paren-when-point-in-periphery nil)
(setq show-paren-when-point-inside-paren t)
(show-paren-mode -1)
;;(add-hook 'prog-mode-hook #'show-paren-mode)
(setq shell-command-switch "-ic")

(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs.backup/")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

(add-to-list
 'display-buffer-alist
 '("\\*helpful"
   (display-buffer-reuse-window display-buffer-same-window)
   (reusable-frames . visible)))

(add-to-list
 'display-buffer-alist
 '("\\*exunit-compilation-"
   (display-buffer-reuse-window display-buffer-same-window)
   (reusable-frames . visible)))

(add-to-list
 'display-buffer-alist
 '("\\*eglot-help "
   (display-buffer-reuse-window display-buffer-same-window)
   (reusable-frames . visible)))

;; Workaround to not show *Compile-Log* popping buffer
(add-to-list
 'display-buffer-alist
 '("\\*Compile-Log\\*"
   (display-buffer-use-some-frame)))

;; TODO validate
(add-to-list
 'display-buffer-alist
 '("\\*"
   (display-buffer-reuse-window display-buffer-same-window)
   (reusable-frames . visible)))

(setq org-plantuml-exec-mode 'plantuml)
(setq org-plantuml-executable-path "/usr/bin/plantuml")

(setq scroll-bar-adjust-thumb-portion nil)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq indicate-empty-lines nil)
(setq frame-title-format "E.M.A.C.S")
;; (setq frame-title-format '((:eval (my/build-frame-name))))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(defun my/unspecify-face (face &optional frame)
 "Fully unspecify all attributes of FACE on FRAME (default: all frames)."
 (face-spec-set face nil frame)
 (apply #'set-face-attribute face frame
  (mapcan (lambda (attr) (list attr 'unspecified))
   (mapcar #'car face-attribute-name-alist))))

(defun my/kill-other-buffers ()
 "Kill all other buffers."
 (interactive)
 (mapc 'kill-buffer
  (cl-delete (current-buffer) (buffer-list))))

(defun my/abbreviate-path (path)
 "Abbreviate the path, replacing home directory by ~/."
 (s-replace-regexp abbreviated-home-dir "~/" path))

(defun my/abbreviate-file-path-or-buffer-name (file-path)
 "Get abbreviate file path or buffer name if not linked to a file."
 (cond
  ((eq file-path nil)
   (->
    (current-buffer)
    (buffer-name)))
  ('else
   (my/abbreviate-path file-path))))

(defun my/pop-to-mark-command ()
 (interactive)
 (pop-to-mark-command)
 (my/maybe-recenter))

(defun my/lines-between-cursor-and-window-top ()
 "Get the number of lines between the cursor and the top."
 (- (line-number-at-pos) (line-number-at-pos (window-start))))

(defun my/lines-between-cursor-and-window-bottom ()
 "Get the number of lines between the cursor and the top."
 (- (line-number-at-pos (window-end)) (line-number-at-pos)))

(defun my/maybe-recenter ()
 (cond
  ((<= (my/lines-between-cursor-and-window-top) 10)
   (recenter))
  ((<= (my/lines-between-cursor-and-window-bottom) 10)
   (recenter))))

(defun my/build-frame-name ()
 "Build the frame string name for `frame-title-format`."
 (let ((main "E.M.A.C.S"))
  (cond
   ((org-clocking-p)
    ;; (format "%s: %s" main (org-clock-get)))
    (concat main ": " (org-clock-get)))
   ('else
    main))))

(defun my/switch-to-minibuffer ()
 "Switch to minibuffer window."
 (interactive)
 (cond
  ((active-minibuffer-window)
   (select-window (active-minibuffer-window)))
  ('else
   (error "Minibuffer is not active"))))

(defun my/kill-this-buffer ()
 "Kill the current buffer."
 (interactive)
 (kill-buffer (current-buffer)))

(defun my/move-line-up ()
 (interactive)
 (transpose-lines 1)
 (forward-line -2))

(defun my/move-line-down ()
 (interactive)
 (forward-line 1)
 (transpose-lines 1)
 (forward-line -1))

(defun my/consult-projectile-or-buffer ()
 (interactive)
 (cond
  ((projectile-project-p)
   (call-interactively #'consult-projectile))
  ('else
   (call-interactively #'consult-buffer))))

(defun my/expand-region (arg)
 (interactive "p")
 (cond
  ((> arg 1)
   (er/contract-region 1))
  ('else
   (er/expand-region 1))))

(defun my/isearch-del-word (&optional arg)
 "Delete word from end of search string and search again.
If search string is empty, just beep."
 (interactive "p")
 (if (= 0 (length isearch-string))
  (ding)
  (setq isearch-string
   (substring isearch-string 0
    (- (min (or arg 1) (length isearch-string)))))
  (setq isearch-message
   (mapconcat 'isearch-text-char-description isearch-string "")))
 ;; Do the following before moving point.
 (funcall (or isearch-message-function #'isearch-message) nil t)
 ;; Use the isearch-other-end as new starting point to be able
 ;; to find the remaining part of the search string again.
 ;; This is like what `isearch-search-and-update' does,
 ;; but currently it doesn't support deletion of characters
 ;; for the case where unsuccessful search may become successful
 ;; by deletion of characters.
 (if isearch-other-end (goto-char isearch-other-end))
 (isearch-search)
 (isearch-push-state)
 (isearch-update))

(defun my/dired-here ()
 "Run dired in the current directory."
 (interactive)
 (dired default-directory))

(defun my/copy-file-context-reference ()
 "Copy file context at point or region for sharing with other software.
If region is active, format as '@relative/path#start_line-end_line'.
Otherwise, format as '@relative/path#line_number'."
 (interactive)
 (if-let ((file-path (buffer-file-name)))
  (let* ((relative-path (cond
                         ((and (fboundp 'projectile-project-root)
                               (projectile-project-root))
                          (file-relative-name file-path (projectile-project-root)))
                         ('else
                          (file-name-nondirectory file-path))))
         (start-line (line-number-at-pos (cond
                                          ((use-region-p) (region-beginning))
                                          ('else (point)))))
         (end-line (when (use-region-p) (line-number-at-pos (region-end))))
         (context (cond
                   (end-line
                    (format "@%s#%d-%d" relative-path start-line end-line))
                   ('else
                    (format "@%s#%d" relative-path start-line)))))
   (kill-new context)
   (message "Copied: %s" context))
  (message "Buffer is not visiting a file")))

(add-to-list 'default-frame-alist '(font . "Cascadia Code-13"))
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "C-.") #'eglot-code-actions)
(global-set-key (kbd "C-u") #'my/pop-to-mark-command)
;; (global-set-key (kbd "C-u") #'pop-to-mark-command)
(global-set-key (kbd "C-x u") #'universal-argument)
(global-set-key (kbd "C-!") #'shell-command)
(global-set-key (kbd "C-j") #'xref-find-definitions)
(global-set-key (kbd "C-\"") #'consult-imenu-multi)
(global-set-key (kbd "C-S-n") #'forward-paragraph)
(global-set-key (kbd "C-S-p") #'backward-paragraph)
(global-set-key (kbd "C-{") #'my/move-line-up)
(global-set-key (kbd "C-è") #'my/move-line-down)
(global-set-key (kbd "C-<backspace>") #'doom/delete-backward-word)
(global-set-key (kbd "C-h") (kbd "<backspace>"))
(global-set-key (kbd "C-S-h") (kbd "C-<backspace>"))
(global-set-key (kbd "C-S-d") #'doom/delete-for)
(global-set-key (kbd "C-x i") #'indent-for-tab-command)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-S-o") (cmd! (other-window -1)))
(global-set-key (kbd "C-v") (cmd! (scroll-up-command 5) (forward-line 5)))
(global-set-key (kbd "C-S-v") (cmd! (scroll-down-command 5) (forward-line -5)))
(global-set-key (kbd "C-S-f") 'forward-word)
(global-set-key (kbd "C-S-b") 'backward-word)
(global-set-key [remap kill-region] 'kill-ring-save)
(global-set-key [remap kill-ring-save] 'kill-region)
(global-set-key (kbd "C-S-w") 'kill-ring-save)
(global-set-key (kbd "C-S-y") #'consult-yank-from-kill-ring)
(global-set-key (kbd "C-S-l") 'visual-line-mode)
(global-set-key (kbd "C-x O") 'my/switch-to-minibuffer)
(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-x C-k") 'my/kill-this-buffer)
(global-set-key (kbd "C-q") 'my/kill-this-buffer)
(global-set-key (kbd "C-,") 'my/expand-region)
(global-set-key (kbd "C-ç") 'text-scale-decrease)
(global-set-key (kbd "C-œ") 'text-scale-increase)
(global-set-key (kbd "C-æ") 'text-scale-)
(global-set-key (kbd "C--") 'doom/decrease-font-size)
(global-set-key (kbd "C-+") 'doom/increase-font-size)
(global-set-key (kbd "C-=") 'doom/reset-font-size)
(global-set-key (kbd "C-0") 'doom/reset-font-size)
(global-unset-key (kbd "C-<return>"))
(global-set-key (kbd "C-i") #'completion-at-point)
(global-set-key (kbd "C-S-i") #'dabbrev-completion)
(global-set-key (kbd "<mouse-2>") nil)
(global-set-key (kbd "C-z") #'winner-undo)
(global-set-key (kbd "C-S-z") #'winner-redo)
(global-set-key (kbd "C-æ") #'winner-redo)

(setq completion-styles '(orderless basic))

(setq shift-select-mode nil)
(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)
(setq scroll-margin 6)
(setq-default indicate-empty-lines nil)
(setq-default tab-width 2)
(setq-default sh-indentation 2)
(setq-default sh-basic-offset 2)
(setq enable-recursive-minibuffers nil)

(setq initial-scratch-message "#+TITLE: Scratch\n\n")
(setq initial-major-mode 'org-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
(remove-hook 'doom-first-buffer-hook #'show-paren-mode)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'corfu-mode)
(add-hook 'prog-mode-hook (lambda () (yas-minor-mode -1)))
(add-hook 'server-switch-hook #'raise-frame)

(setq doom-leader-alt-key "C-t")

(setq global-text-scale-adjust-resizes-frames nil)

(defun my/insert-tab ()
 "Insert a tab at point."
 (interactive)
 (insert "	"))

(map! :leader
 "d" #'my/dired-here
 "!" #'shell-command
 "TAB" #'my/insert-tab
 "m" #'notmuch-jump-search
 "M" #'compose-mail
 "I" #'indent-region
 "o t" #'vterm
 "o T" #'+vterm/here
 "y" #'my/swtich-to-vterm-buffer
 "C-y" #'my/swtich-to-vterm-buffer
 "T" #'consult-buffer
 "C-T" #'consult-buffer
 "t" #'my/consult-projectile-or-buffer
 "C-t" #'my/consult-projectile-or-buffer
 "q" #'delete-window
 "1" #'delete-other-windows
 "2" #'split-window-below
 "3" #'split-window-right
 "j" #'consult-imenu
 "J" #'consult-imenu-multi
 ;; "d" #'help-command
 ;; "d c" #'describe-command
 ;; "d d" #'+lookup/documentation
 ;; "d K" #'describe-keymap
 "h" #'help-command
 "h h" #'eldoc
 "x" #'consult-mode-command
 "<SPC>" #'execute-extended-command
 "C-<SPC>" #'execute-extended-command
 "_" #'vertico-repeat-select
 "p" #'projectile-command-map
 "p d" #'projectile-dired
 "g" #'consult-ripgrep
 "v" #'magit-status
 "V" #'magit-status-here
 "b" #'switch-to-buffer
 "B" #'switch-to-buffer-other-window
 "C-k" #'my/kill-this-buffer
 "=" #'text-scale-adjust
 "0" #'text-scale-adjust
 "-" #'text-scale-decrease
 "+" #'text-scale-increase
 "w" #'winner-undo
 "W" #'winner-redo
 "l" #'rotate-layout
 "L" #'rotate-window
 "r b" #'rename-buffer
 "r f" #'rename-file
 "," #'treemacs-select-window
 "." #'treemacs-narrow-to-current-file
 "e" #'consult-flycheck)

(map! :map prog-mode-map
 "C-i" 'completion-at-point)

(use-package all-the-icons
 :if (display-graphic-p))

(use-package! consult
 :init
 (defun my/consult-buffer-with-search (search)
  "Run consult-buffer with SEARCH pre-filled in the minibuffer."
  (interactive)
  (minibuffer-with-setup-hook
   (lambda ()
    (insert search))
   (consult-buffer)))
 (defun my/swtich-to-vterm-buffer ()
  "Switch to a vterm buffer."
  (interactive)
  (let* ((vterm-buffers
          (seq-filter
           (lambda (buf)
            (eq (buffer-local-value 'major-mode buf) 'vterm-mode))
           (buffer-list)))
         (buffer-names (mapcar #'buffer-name vterm-buffers)))
   (cond
    (buffer-names
     (switch-to-buffer (completing-read "Switch to vterm buffer: " buffer-names nil t)))
    (t
     (message "No vterm-mode buffers found")))))
 (defun my/consult-kill-buffer ()
  (interactive)
  (if-let ((buffer-name (substring (consult--vertico-candidate) 0 -1))
           (buffer (get-buffer buffer-name)))
   (progn (kill-buffer buffer)
    (minibuffer-keyboard-quit))
   (message "Not a buffer")))
 :config
 (setq consult--source-buffer
  (plist-put consult--source-buffer :items
   (lambda ()
    (mapcar #'buffer-name
     (seq-filter (lambda (buf)
                  (and (buffer-live-p buf)
                   (not (string-prefix-p " " (buffer-name buf)))))
      (buffer-list))))))
 (setq consult-preview-key "C-.")
 :bind
 (:map minibuffer-mode-map
  ("C-q" . my/consult-kill-buffer)
  ("C-r" . vertico-previous)
  ("C-s" . vertico-next)))

(use-package! consult-projectile
 :after projectile
 :config
 (setq consult-projectile-display-info nil)
 (setq cosult-projectile-use-projectile-switch-project #'magit-status)
 (setq consult-projectile--source-projectile-buffer
  (list :name     "Project Buffer"
   :narrow   '(?b . "Buffer")
   :category 'buffer
   :face     'consult-buffer
   :history  'buffer-name-history
   :state    #'consult--buffer-state
   :enabled  #'projectile-project-root
   :items
   (lambda ()
    (when-let (root (projectile-project-root))
     (mapcar #'buffer-name
      (seq-filter (lambda (buffer)
                   (when-let (directory (buffer-local-value 'default-directory buffer))
                    (and (not (string-match-p "^\*.+\*$" (buffer-name buffer)))
                     (string-prefix-p root directory))))
       (consult--buffer-query :sort 'nil))))))))

(use-package! copilot
 :bind
 (:map copilot-completion-map
  ("C-<return>" . 'copilot-accept-completion)
  ("C-S-<return>" . 'copilot-accept-completion-by-word)))

(setq completion-in-region-function
 (lambda (&rest args)
  (apply (if vertico-mode
          #'consult-completion-in-region
          #'completion--in-region)
   args)))

(use-package! corfu
 :config
 (setq-default corfu-auto nil)
 (setq corfu-popupinfo-delay '(0.8 . 0.4))
 (corfu-popupinfo-mode -1)
 (setq corfu-preview-current nil)
 (setq corfu-quit-at-boundary nil)
 (setq corfu-cycle t)
 :bind
 (:map corfu-map
  ("C-S-n" . corfu-popupinfo-scroll-up)
  ("C-S-p" . corfu-popupinfo-scroll-down)
  ("C-." . corfu-info-documentation)))

(use-package! diff-hl
 :after magit
 :hook
 (magit-pre-refresh . diff-hl-magit-pre-refresh)
 (magit-post-refresh . diff-hl-magit-post-refresh)
 :init
 (global-diff-hl-mode 1)
 (diff-hl-flydiff-mode 1))
 ;; :config
 ;; (set-fringe-mode '(1 . 1)))

(use-package! dired
 :hook
 (dired-mode . dired-omit-mode)
 (dired-mode . dired-hide-details-mode)
 :config
 (setq dired-listing-switches "-alh --group-directories-first -v")
 (setq dired-omit-files "^\\./?$\\|^\\.\\./?$")
 (map! :map dired-mode-map
  "C-o" nil
  "TAB" #'dired-subtree-cycle
  "<" #'dired-up-directory
  ;; better if it does not open file (only cd on directories)
  ">" #'dired-find-file
  ;; nothing like this found
  ;; "f" dired-forward
  ;; trying to setup "back"
  "b" #'dired-prev-subdir))

(use-package! dired-subtree
 :hook
 (dired-subtree-after-insert . dired-omit-mode)
 :config
 (my/unspecify-face 'dired-subtree-depth-1-face)
 (my/unspecify-face 'dired-subtree-depth-2-face)
 (my/unspecify-face 'dired-subtree-depth-3-face)
 (my/unspecify-face 'dired-subtree-depth-4-face)
 (my/unspecify-face 'dired-subtree-depth-5-face)
 (my/unspecify-face 'dired-subtree-depth-6-face))

;; Used as a global config (not related to a package)
;;
;; TODO cleanup "emacs" config
(use-package! emacs
 :config
 (add-hook 'window-size-change-functions 'frame-hide-title-bar-when-maximized)
 (setq my/doom-dashboard-ascii-banner
  '("    ██████                                         "
    "   ███░░███                                      TM"
    "  ░███ ░░░   ██████   ██████  █████ ████  █████    "
    " ███████    ███░░███ ███░░███░░███ ░███  ███░░     "
    "░░░███░    ░███ ░███░███ ░░░  ░███ ░███ ░░█████    "
    "  ░███     ░███ ░███░███  ███ ░███ ░███  ░░░░███   "
    "  █████    ░░██████ ░░██████  ░░████████ ██████  ██"
    " ░░░░░      ░░░░░░   ░░░░░░    ░░░░░░░░ ░░░░░░  ░░ "
    "                                                   "
    " Because things take time.                 (ง •̀_•́)ง"))
 (defun my/doom-dashboard-draw-ascii-banner-fn ()
  (let* ((longest-line (apply #'max (mapcar #'length my/doom-dashboard-ascii-banner))))
   (put-text-property
    (point)
    (dolist (line my/doom-dashboard-ascii-banner (point))
     (insert
      (+doom-dashboard--center
       +doom-dashboard--width
       (concat line (make-string (max 0 (- longest-line (length line))) 32)))
      "\n"))
    'face 'doom-dashboard-banner)))
 (defun my/doom-dashboard-widget-loaded ()
  (when doom-init-time
   (insert
    "\n\n"
    (propertize
     (+doom-dashboard--center
      +doom-dashboard--width
      (my/doom-display-benchmark-h 'return))
     'face 'doom-dashboard-loaded))))
 (defun my/doom-display-benchmark-h (&optional return-p)
  "Display a benchmark including number of packages and modules loaded.

If RETURN-P, return the message as a string instead of displaying it."
  (funcall (if return-p #'format #'message)
   "%d packages, %d modules, loaded in %.03fs"
   (- (length load-path) (length (get 'load-path 'initial-value)))
   (if doom-modules (hash-table-count doom-modules) -1)
   doom-init-time))
 (setq +doom-dashboard-ascii-banner-fn #'my/doom-dashboard-draw-ascii-banner-fn)
 (setq +doom-dashboard-functions `(doom-dashboard-widget-banner))
 ;;(setq +doom-dashboard-functions `(doom-dashboard-widget-banner my/doom-dashboard-widget-loaded))
 :bind
 (:map +doom-dashboard-mode-map
  ("a" . 'org-agenda)
  ("b" . 'switch-to-buffer)
  ("f" . 'find-file)
  ("p" . 'projectile-switch-project)
  ("r" . 'recentf)
  ("t" . '+vterm/here)))

(use-package! doom-themes
 :config
 (setq doom-themes-enable-bold t)
 (setq doom-themes-enable-italic t)
 ;; or for treemacs users
 (setq doom-themes-treemacs-theme "doom-atom")
 (doom-themes-treemacs-config)
 ;; Corrects (and improves) org-mode's native fontification.
 (doom-themes-org-config)
 :bind
 (:map +doom-dashboard-mode-map
  ("a" . 'org-agenda)
  ("b" . 'switch-to-buffer)
  ("f" . 'find-file)
  ("m" . 'notmuch-jump-search)
  ("M" . 'compose-mail)
  ("p" . 'projectile-switch-project)
  ("r" . 'recentf)
  ("t" . '+vterm/here)))

(use-package! eglot
 :init
 (fset #'jsonrpc--log-event #'ignore)
 (setq eglot-send-changes-idle-time 0.25)
 (setq eglot-events-buffer-config '(:size 0 :format full))
 (add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1)))
 :config
 (add-to-list 'eglot-server-programs
  '((elixir-mode elixir-ts-mode heex-mode heex-ts-mode) . ("elixir-ls")))
 (add-to-list 'eglot-server-programs
  '(svelte-mode . ("svelteserver" "--stdio")))
 :hook
 (eglot-mode . flycheck-eglot-mode))

(use-package! eldoc
 :init
 (global-eldoc-mode -1)
 :config
 (setq eldoc-idle-delay most-positive-fixnum) ;; pseudo disable delay
 (setq eldoc-echo-area-use-multiline-p nil)
 (setq eldoc-echo-area-display-truncation-message t)
 (setq eldoc-echo-area-prefer-doc-buffer t)
 (setq eldoc-doc-buffer-separator "\n\n")) ;; does not seem to work 🤔

(use-package! elixir-mode
 :after eglot
 :hook
 (elixir-mode . exunit-mode)
 (elixir-mode . eglot-ensure)
 (before-save . eglot-format-buffer))

;; (use-package! elixir-ts-mode
;;   :init
;;   (add-to-list 'auto-mode-alist
;;                '("\\.ex\\'" . elixir-ts-mode)
;;                '("\\.exs\\'" . elixir-ts-mode))
;;   :hook
;;   (elixir-ts-mode . exunit-mode)
;;   (elixir-ts-mode . eglot-ensure)
;;   (before-save . eglot-format-buffer))

(use-package! exunit
 :init
 (add-to-list
  'display-buffer-alist
  '("\\*exunit-compilation\\*"
    (display-buffer-reuse-window display-buffer-same-window)
    (reusable-frames . visible)))
 :bind
 (:map exunit-mode-map
  ("C-c t" . 'exunit-transient))
 (:map exunit-compilation-mode-map
  ("C-o" . nil)
  ("r" . 'recompile)))

(use-package! flycheck
 :init
 (setq flycheck-indication-mode 'left-fringe)
 (setq flycheck-display-errors-delay 0.2))

;; (use-package! flycheck-languagetool
;;   :init
;;   ;; (setq flycheck-languagetool-server-jar "languagetool")
;;   ;; (setq flycheck-languagetool-server-jar "/usr/share/java/languagetool/languagetool-server.jar")
;;   (setq flycheck-languagetool-server-port 8081)
;;   (setq flycheck-languagetool-language "fr-FR")
;;   (setq flycheck-languagetool-server-command '("languagetool" "--http" "--port" "8081"))
;;   :hook
;;   (text-mode . flycheck-languagetool-setup)
;;   (markdown-mode . flycheck-languagetool-setup)
;;   (org-mode . flycheck-languagetool-setup))

(use-package! goggles
 :hook ((prog-mode text-mode) . goggles-mode)
 :config
 (setq-default goggles-pulse t))

(use-package! isearch
 :config
 (setq isearch-lazy-highlight t)
 ;; (setq isearch-lazy-highlight-error t)
 (setq lazy-highlight-initial-delay 0)
 (setq isearch-wrap-pause nil)
 (setq isearch-lazy-count nil)
 (setq isearch-allow-motion t)
 (setq isearch-allow-scroll 'unlimited)
 (defun my/isearch-post-action () nil
  (when (not (isearch-fail-pos)) (my/maybe-recenter)))
 :hook
 (isearch-update-post . my/isearch-post-action)
 :bind
 (:map isearch-mode-map
  ("C-/" . isearch-delete-char)
  ("<backspace>" . isearch-del-char)
  ("C-h" . isearch-del-char)
  ("C-S-h" . isearch-del-char) ; isearch-del-word
  ("C-i" . isearch-dabbrev-expand)
  ("C-." . consult-line)))

(use-package! projectile
 :init
 (setq projectile-command-map nil)
 (setq projectile-enable-caching nil)
 (setq projectile-switch-project-action 'magit-status)
 (setq projectile-current-project-on-switch 'keep)
 ;; (defun my/projectile-ignore-project (directory)
 ;;   (mapcar (lambda (project-root) (string-prefix-p project-root directory))
 ;;           projectile-known-projects))
 ;; (setq projectile-ignored-project-function #'my/projectile-ignore-project)
 (defun my/projectile-open-notes ()
  "Open the note file at the root of the project."
  (interactive)
  (find-file
   (concat (projectile-project-root) ".local/Notes.org")))
 (defun my/projectile-relative-buffer-name ()
  (ignore-errors
   (rename-buffer
    (file-relative-name buffer-file-name (projectile-project-root)))))
 (add-hook 'find-file-hook #'my/projectile-relative-buffer-name))
;; :bind
;; (:map projectile-command-map
;;       ("g" . consult-ripgrep)
;;       ("n" . my/projectile-open-notes)))

(use-package! python-mode
 :after eglot
 :hook
 (python-mode-hook . eglot-ensure)
 (before-save . eglot-format-buffer))
;; :init
;; (add-to-list 'eglot-server-programs '(python-mode . ("ruff" "server"))))

(use-package! magit
 :after nerd-icons
 :config
 (setq magit-region-highlight-hook nil)
 (setq magit-section-highlight-hook nil)
 (setq magit-section-unhighlight-hook nil)
 (setq magit-verbose-messages t)
 (setq magit-diff-refine-hunk nil)
 (setq magit-commit-show-diff nil)
 (defun my/show-paren-local-disable-mode ()
  (show-paren-local-mode -1))
 (setq magit-display-buffer-function
  (lambda (buffer)
   (display-buffer buffer '(display-buffer-same-window))))
 :custom
 (magit-format-file-function #'magit-format-file-nerd-icons)
 :hook
 (magit-status-mode-hook . my/show-paren-local-disable-mode)
 (magit-section-movement-hook . magit-hunk-maybe-recenter)
 :bind
 (:map magit-mode-map
  ("C-S-i" . #'magit-section-cycle-diffs))
 (:map magit-status-mode-map
  ("i" . magit-section-toggle)
  ("I" . magit-gitignore)))

(use-package! magit-todos
 :after magit
 :config
 ;;(setq magit-todos-insert-after '(bottom))
 (magit-todos-mode 1))

(use-package! marginalia
 :after vertico
 :init
 (marginalia-mode -1))

(use-package! markdown-mode
 :config
 (with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
   '(markdown-mode . ("harper-ls" "--stdio")))))

(use-package nerd-icons)

(use-package! notmuch
 :config
 (setq notmuch-saved-searches
  '((:name "inbox" :query "tag:inbox" :sort-order newest-first :key "i")
    (:name "unread" :query "tag:unread" :sort-order newest-first :key "u")
    (:name "flagged" :query "tag:flagged" :sort-order newest-first :key "f")
    (:name "sent" :query "tag:sent" :sort-order newest-first :key "t")
    (:name "drafts" :query "tag:draft" :sort-order newest-first :key "d")
    (:name "all mail" :query "*" :sort-order newest-first :key "a")))
 (setq notmuch-hello-logo nil))

(use-package! nov
 :hook
 (nov-mode . my/nov-font-setup)
 :config
 (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
 (defun my/nov-font-setup ()
  (face-remap-add-relative 'variable-pitch
   :family "Liberation Serif"
   :height 140)))

(use-package! olivetti
 :init
 (define-global-minor-mode global-olivetti-mode olivetti-mode olivetti-mode)
 (setq-default olivetti-body-width 124))

(use-package! orderless
 :init
 (setq completion-ignore-case t)
 (setq completion-styles '(orderless)))

(use-package! org
 :init
 (setq org-cycle-include-plain-lists 'integrate)
 (setq org-table-convert-region-max-lines 9999)
 (setq org-directory "~/Notes")
 (setq org-indent-indentation-per-level 1)
 (setq org-agenda-skip-deadline-if-done t)
 ;; :hook
 ;; (org-mode-hook . auto-save-visited-mode)
 :config
 (defun my/org-advice-indent-line (orig-fun &rest args)
  "Use custom indentation for list items, otherwise use default."
  (unless (my/org-indent-relative-to-list-item)
   (apply orig-fun args)))
 (advice-add 'org-indent-line :around #'my/org-advice-indent-line)
 (with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
   '(org-mode . ("harper-ls" "--stdio"))))
 (defun my/org-move-subtree-or-item-or-line-up ()
  (interactive)
  (cond
   ((org-at-heading-p)
    (org-move-subtree-up))
   ((org-at-item-p)
    (org-move-item-up))
   ('else
    (my/move-line-up))))
 (defun my/org-move-subtree-or-item-or-line-down ()
  (interactive)
  (cond
   ((org-at-heading-p)
    (org-move-subtree-down))
   ((org-at-item-p)
    (org-move-item-down))
   ('else
    (my/move-line-down))))
 (setq org-startup-folded t)
 (setq org-hide-block-startup nil)
 (setq org-priority-faces
  (quote
   ((65 . "#E05A5A")
    (66 . "#AB5353")
    (67 . "#6D3434"))))
 (setq org-todo-keywords
  '((sequence
     "TODO(t)"
     "WIP!(w)"
     "|"
     "DONE(d)")))
 (setq org-todo-keyword-faces
  '(("TODO" . log-edit-summary)
    ("WIP!" . mode-line)
    ("DONE" . org-done)))
 :bind
 (:map org-mode-map
  ("C-c w" . org-cut-subtree)
  ("C-c t" . org-todo)
  ("C-c f" . org-toggle-narrow-to-subtree)
  ("C-c p" . org-priority)
  ("C-c o" . my/org-sort-entries)
  ("C-è" . my/org-move-subtree-or-item-or-line-down)
  ("C-{" . my/org-move-subtree-or-item-or-line-up)
  ("C-S-g" . org-tree-slide-mode)
  ("C-c i" . org-toggle-inline-images)
  ("C-c >" . org-do-demote)
  ("C-c C->" . org-demote-subtree)
  ("C-c <" . org-do-promote)
  ("C-c C-<" . org-promote-subtree)
  ("C-c a" . org-archive-subtree)
  ("C-," . nil)))

(use-package! org-roam
 :custom
 (org-roam-directory (file-truename "~/Notes"))
 :bind
 (:map doom-leader-map
  ("n" . org-roam-node-find))
 :config
 ;; If you're using a vertical completion framework, you might want a more informative completion interface
 (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
 (org-roam-db-autosync-mode)
 ;; If using org-roam-protocol
 (require 'org-roam-protocol))

(use-package! org-tree-slide-mode
 :bind
 (:map org-tree-slide-mode-map
  ("C-S-g" . org-tree-slide-mode)
  ("<mouse-1>" . transient-noop)
  ("<mouse-3>" . transient-noop)
  ("<down-mouse-1>" . org-tree-slide-move-next-tree)
  ("<down-mouse-3>" . org-tree-slide-move-previous-tree)))

(use-package! doom-nano-modeline
 :init
 ;; (doom-modeline-mode -1)
 (doom-nano-modeline-mode 1)
 (global-hide-mode-line-mode 1)
 :config
 (defun doom-nano-modeline--magit-status-mode ()
  "Render the modeline in `magit-status-mode'."
  (doom-nano-modeline--render
   `(("Magit:" . nil)
     (" " . nil)
     (,(file-name-nondirectory
        (directory-file-name
         (file-name-directory default-directory))) . nil)
     (" " . nil)
     (,(concat "[#" (magit-get-current-branch) "]") . nil))
   nil
   t))
 (setq doom-nano-modeline-top-padding 0)
 (setq doom-nano-modeline-bottom-padding 0)
 (setq doom-nano-modeline-position 'top))

(use-package! rustic
 :config
 (add-to-list
  'display-buffer-alist
  '("\\*cargo-run\\*"
    (display-buffer-reuse-window display-buffer-same-window)
    (reusable-frames . visible)))
 (add-to-list
  'display-buffer-alist
  '("\\*cargo-test\\*"
    (display-buffer-reuse-window display-buffer-same-window)
    (reusable-frames . visible)))
 (add-hook 'rustic-mode-hook (lambda () (setq tab-width 2)))
 :bind
 (:map rustic-mode-map
  ("C-c t a" . rustic-cargo-test)
  ("C-c t s" . rustic-cargo-current-test)
  ("C-c t r" . rustic-cargo-test-rerun))
 (:map rustic-cargo-run-mode-map
  ("r" . rustic-cargo-run-rerun))
 (:map rustic-cargo-test-mode-map
  ("r" . rustic-cargo-test-rerun))
 (:map rustic-compilation-mode-map
  ("C-o" . nil)
  ("p" . nil) ; prev error
  ("n" . nil) ; next error
  ("r" . rustic-build)))

(use-package ultra-scroll
 :init
 (setq scroll-conservatively 101) ; important!
 (setq scroll-margin 0)
 :config
 (ultra-scroll-mode 1))

(use-package! spacious-padding
 :config
 (setq spacious-padding-widths
  '(:internal-border-width 12
    :header-line-width 0
    :mode-line-width 2
    :tab-width 4
    :right-divider-width 20
    :scroll-bar-width 8))
 ;;:fringe-width 4))
 :init
 (spacious-padding-mode 1))

(use-package! treemacs
 :config
 (treemacs-git-mode 'deferred)
 (treemacs-filewatch-mode)
 (treemacs-add-and-display-current-project-exclusively)
 (treemacs-project-follow-mode)
 (treemacs-fringe-indicator-mode -1)
 (setq treemacs--project-follow-delay 0.1)
 (setq doom-variable-pitch-font (font-spec :family "Cascadia Mono"))
 (setq doom-themes-treemacs-enable-variable-pitch nil)
 :bind
 (:map treemacs-mode-map
  ("i" . treemacs-TAB-action)))

(use-package! treesit-auto
 :custom
 (treesit-auto-install 'prompt)
 :config
 (setq treesit-auto-langs '(elixir))
 ;; (treesit-auto-add-to-auto-mode-alist 'all)
 (global-treesit-auto-mode))

(use-package! vertico
 :init
 (vertico-mode)
 (vertico-posframe-mode -1)
 (vertico-buffer-mode)
 (add-to-list
  'display-buffer-alist
  '("\\*vertico"
    (display-buffer-same-window)))
 :config
 (defun my/vertico-posframe-reload ()
  (interactive)
  (vertico-posframe-mode -1)
  (vertico-buffer-mode)
  (vertico-buffer-mode -1)
  (vertico-posframe-mode))
 (setq vertico-posframe-border-width 6)
 (setq vertico-posframe-border-width 6)
 (setq vertico-posframe-width 100)
 (setq vertico-posframe-height nil)
 :bind
 (:map vertico-map
  ("C-v" . vertico-next-group)
  ("C-S-v" . vertico-previous-group)
  ("C-S-n" . next-history-element)
  ("C-S-p" . previous-history-element)))

(add-hook 'minibuffer-mode #'hide-mode-line-mode)

(use-package! vterm
 :config
 (setq vterm-buffer-name "Term")
 (setq vterm-buffer-name-string "Term: %s")
 (defun my/vterm-set-buffer-font ()
  "Set font to a variable width  fonts in current buffer"
  (interactive)
  (setq buffer-face-mode-face '(:family "Cascadia"))
  (buffer-face-mode))
 :hook
 (vterm-mode . my/vterm-set-buffer-font)
 :bind
 (:map vterm-mode-map
  ("C-q" . nil) ; looking for a better "exit"
  ("C-S-h" . vterm-send-C-w)
  ("C-S-d" . vterm-send-M-d)
  ("C-g" . vterm--self-insert)
  ("C-." . vterm-copy-mode)
  ("C-/" . vterm-undo)
  ("C-<" . vterm-send-C-a)
  ("C->" . vterm-send-C-e)
  ("C-j" . woman)
  ("C-v" . nil)
  ("C-l" . vterm-clear)
  ("C-o" . nil)
  ("C-<return>" . vterm-send-C-m))
 (:map vterm-copy-mode-map
  ("C-." . vterm-copy-mode-done)))

(use-package! winner
 :config
 (setq winner-boring-buffers-regexp "*Minibuf-"))
