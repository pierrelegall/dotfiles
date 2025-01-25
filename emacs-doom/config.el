;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil ; don't auto-initialize!
      ;; don't add that `custom-set-variables' block to my init.el!
      package--init-file-ensured t)

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
(setq doom-theme 'doom-laserwave)

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
(show-paren-mode -1)
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

(custom-set-faces!
  '(font-lock-comment-face
    :foreground "#4d4d4d")
  '(cursor
    :background "#0ff142")
  '(show-paren-match
    :inverse-video t)
  ;; '(doom-nano-modeline-inactive-face
  ;;   :background "#222222"
  ;;   :foreground "#8c3fa0")
  '(line-number
    :foreground "#353a3f")
  '(line-number-current-line
    :foreground "#858a8f")
  '(magit-diff-context-highlight
    :background nil
    :foreground nil)
  '(magit-diff-file-heading-highlight
    :background nil
    :foreground nil)
  '(magit-diff-hunk-heading
    :background nil
    :foreground "#4a425c")
  '(magit-diff-hunk-heading-highlight
    :background nil
    :foreground "#dbb7ff")
  '(magit-section-highlight
    :background nil
    :foreground nil)
  '(diff-refine-added
    :inherit magit-diff-added-highlight
    :background nil
    :inverse-video nil
    :weight ultra-bold)
  '(diff-refine-removed
    :inherit magit-diff-removed-highlight
    :background nil
    :inverse-video nil
    :weight ultra-bold)
  '(eglot-inlay-hint-face
    :height 0.8)
  '(magit-diff-added
    :background nil
    :weight normal)
  '(magit-diff-removed
    :background nil
    :weight normal)
  '(magit-diff-added-highlight
    :background nil
    :weight normal)
  '(magit-diff-removed-highlight
    :background nil
    :weight normal)
  '(magit-diff-context
    :background nil)
  '(org-drawer
    :foreground nil
    :inherit org-special-keyword)  
  '(org-level-2 
    :inherit outline-2)
  '(region
    ;;inverse-video t)
    ;;background "#1d2027"
    :background "#101010")
  '(isearch
    :foreground "#f8ff00"
    :background nil
    :underline t)
  '(treemacs-file-face
    :inherit nil)
  '(treemacs-directory-face
    :inherit nil)
  '(treemacs-marked-file-face
    :inherit nil)
  '(treemacs-tags-face
    :inherit nil)
  '(secondary-selection
    :box t)
  '(treemacs-git-modified-face
    :foreground "#39bae6")
  '(org-block-begin-line
    :background nil
    :foreground nil
    :inherit org-document-info-keyword)
  '(window-divider
    :foreground "#252525"))

(setq org-indent-indentation-per-level 2)

(fringe-mode '(4 . 4))
(setq scroll-bar-adjust-thumb-portion nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq indicate-empty-lines nil)
(setq frame-title-format '((:eval (my/build-frame-name))))

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

(defun my/abbreviate-path (path)
  "Abbreviate the path, replacing home directory by ~/."
  (s-replace-regexp abbreviated-home-dir "~/" path))

(defun my/abbreviate-file-path-or-buffer-name (file-path)
  "Get abbreviate file path or buffer name if not linked to a file."
  (cond
   ((eq file-path nil)
    (-> (current-buffer)
        (buffer-name)))
   (t
    (my/abbreviate-path file-path))))

(defun my/build-frame-name ()
  "Build the frame string name for `frame-title-format`."
  (-> (current-buffer)
      (buffer-file-name)
      (my/abbreviate-file-path-or-buffer-name)))

(defun my/switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(defun my/switch-to-last-buffer ()
  "Switch to the last buffer."
  (interactive)
  (switch-to-buffer nil))

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

(defun my/switch-to-buffer-or-project-buffer ()
  (interactive)
  (cond ((projectile-project-p) (consult-project-buffer)
         (call-interactively #'consult-buffer))))

(defun my/consult-projectile-or-buffer ()
  (interactive)
  (cond ((projectile-project-p) (call-interactively #'consult-projectile))
        (t                      (call-interactively #'consult-buffer))))

(defun my/expand-region (arg)
  (interactive "p")
  (cond ((> arg 1) (er/contract-region 1))
        (t         (er/expand-region 1))))

(defun my/isearch-del-word (&optional arg)
  "Delete wrd from end of search string and search again.
If search string is empty, just beep."
  (interactive "p")
  (if (= 0 (length isearch-string))
      (ding)
    (setq isearch-string (substring isearch-string 0
                                    (- (min (or arg 1)
                                            (length isearch-string))))
          isearch-message (mapconcat 'isearch-text-char-description
                                     isearch-string "")))
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

;(add-to-list 'default-frame-alist '(font . "Cascadia Mono-12"))
(add-to-list 'default-frame-alist '(font . "Fira Mono-12"))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq server-raise-frame t)

(global-set-key (kbd "C-.") #'eglot-code-actions)
;(global-set-key (kbd "C-u") #'+vterm/here)
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
(global-set-key (kbd "C-x i") 'indent-for-tab-command)
(global-set-key (kbd "C-o") 'other-window)
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
(global-set-key (kbd "C-0") 'doom/reset-font-size)
(global-set-key (kbd "C--") 'doom/decrease-font-size)
(global-set-key (kbd "C-+") 'doom/increase-font-size)
(global-set-key (kbd "C-=") 'doom/reset-font-size)
(global-unset-key (kbd "C-<return>"))
(global-set-key (kbd "C-i") #'completion-at-point)
(global-set-key (kbd "C-S-i") #'dabbrev-completion)
;(global-set-key (kbd "C-j") #'projectile-toggle-between-implementation-and-test)
(global-set-key (kbd "C-`") #'+treemacs/toggle)
(global-set-key (kbd "<mouse-2>") nil)

(setq completion-styles '(orderless basic))

(setq shift-select-mode nil)
(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)
(setq scroll-margin 6)
(setq-default indicate-empty-lines nil)
(setq-default tab-width 2)
(setq enable-recursive-minibuffers nil)

(setq initial-scratch-message "#+TITLE: Scratch\n\n")
(setq initial-major-mode 'org-mode)

(global-visual-line-mode)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
(remove-hook 'doom-first-buffer-hook #'show-paren-mode)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'corfu-mode)
(add-hook 'server-switch-hook #'raise-frame)

;; (set-frame-parameter nil 'alpha '(95 . 50))
;; (add-to-list 'default-frame-alist '(alpha . 95))

(setq doom-leader-alt-key "C-t")

(setq global-text-scale-adjust-resizes-frames nil)

(map! :leader
      "q" #'delete-window
      "1" #'delete-other-windows
      "2" #'split-window-below
      "3" #'split-window-right
      "j" #'consult-imenu
      "J" #'consult-imenu-multi
      "d" #'help-command
      "d c" #'describe-command
      "d d" #'+lookup/documentation
      "d K" #'describe-keymap
      "h" #'help-command
      "h h" #'+lookup/documentation
      "x" #'consult-mode-command
      "<SPC>" #'execute-extended-command
      "C-<SPC>" #'execute-extended-command
      "S-<SPC>" #'vertico-repeat
      "C-t" #'my/consult-projectile-or-buffer
      "p" #'projectile-command-map
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
      "r l" #'rotate-layout
      "r w" #'rotate-window
      "r o" #'recentf-open-files
      "r b" #'rename-buffer
      "r f" #'rename-file
      "t" #'+vterm/here
      "," #'treemacs-select-window
      "." #'treemacs-narrow-to-current-file
      "e" #'consult-flycheck)

(map! :map prog-mode-map
      "C-i" 'completion-at-point)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package! consult
  :init
  (defun my/consult-kill-buffer ()
    (interactive)
    (if-let ((buffer-name (substring (consult--vertico-candidate) 0 -1))
             (buffer (get-buffer buffer-name)))
        (progn (kill-buffer buffer)
               (minibuffer-keyboard-quit))
      (message "Not a buffer")))
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

(use-package! corfu
  :config
  (setq corfu-popupinfo-delay '(0.8 . 0.4))
  (corfu-popupinfo-mode)
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
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1))

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
        ("F" . 'fireplace)
        ("l" . 'my/switch-to-last-buffer)
        ("p" . 'projectile-switch-project)
        ("r" . 'recentf)
        ("t" . '+vterm/here)))

(use-package! eglot
  :init
  (fset #'jsonrpc--log-event #'ignore)
  (setq eglot-send-changes-idle-time 0.25)
  (setq eglot-events-buffer-config '(:size 0 :format full))
  (setq-default eglot-inlay-hints-mode nil)
  :config
  (add-to-list 'eglot-server-programs
               '((elixir-ts-mode heex-ts-mode) . ("elixir-ls")))
               ;; '((elixir-ts-mode heex-ts-mode) . ("/home/pierre/Factory/lexical/_build/dev/package/lexical/bin/start_lexical.sh")))
  :hook
  (eglot-mode . flycheck-eglot-mode))

;; (use-package! eglot-booster
;;   :after eglot
;;   :config (eglot-booster-mode))

(use-package! eldoc
  :init
  (global-eldoc-mode -1)
  :config
  (setq eldoc-echo-area-use-multiline-p nil)
  (setq eldoc-echo-area-display-truncation-message t)
  (setq eldoc-echo-area-prefer-doc-buffer t)
  (setq eldoc-idle-delay 0.2))

(use-package! elixir-mode
  :after eglot
  ;; :init
  ;; (add-to-list 'major-mode-remap-alist '(elixir-mode . elixir-ts-mode))
  ;; (add-to-list 'eglot-server-programs
  ;;              '(elixir-ts-mode . ("elixir-ls")))
  :hook
  (elixir-mode . exunit-mode)
  (elixir-mode . eglot-ensure)
  (before-save . eglot-format-buffer))

(use-package! elixir-ts-mode
  :init
  (add-to-list 'auto-mode-alist
               '("\\.ex\\'" . elixir-ts-mode)
               '("\\.exs\\'" . elixir-ts-mode))
  :hook
  (elixir-ts-mode . exunit-mode)
  (elixir-ts-mode . eglot-ensure)
  (before-save . eglot-format-buffer))

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

(use-package! feature-mode
  :init
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))

(use-package! flycheck
  :init
  (setq flycheck-indication-mode nil)
  (setq flycheck-display-errors-delay 0.2)
  (global-flycheck-mode))

(use-package flycheck-languagetool
  :disabled
  :init
  (setq flycheck-languagetool-server-jar nil)
  (setq flycheck-languagetool-server-port 8081)
  (setq flycheck-languagetool-server-command '("languagetool" "--http" "--port" "8080"))
  :hook
  (text-mode . flycheck-languagetool-setup))

(use-package isearch
(use-package! goggles
  :hook ((prog-mode text-mode) . goggles-mode)
  :config
  (setq-default goggles-pulse t))

(use-package! golden-ratio)

  :config
  (setq isearch-lazy-highlight t)
  ;; (setq isearch-lazy-highlight-error t)
  (setq lazy-highlight-initial-delay 0)
  (setq isearch-wrap-pause 'no)
  (setq isearch-lazy-count nil)
  (setq isearch-allow-motion t)
  (setq isearch-allow-scroll 'unlimited)
  (defun my/isearch-post-action () nil)
  ;(unless (isearch-fail-pos) (recenter)))
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
  (add-hook 'find-file-hook #'my/projectile-relative-buffer-name)
  :bind
  (:map projectile-command-map
        ("g" . consult-ripgrep)
        ("n" . my/projectile-open-notes)))

(use-package! magit
  :config
  (setq magit-region-highlight-hook nil)
  (setq magit-section-highlight-hook nil)
  (setq magit-section-unhighlight-hook nil)
  (setq magit-verbose-messages t)
  (setq magit-diff-refine-hunk nil)
  (defun my/show-paren-local-disable-mode ()
    (show-paren-local-mode -1))
  :hook
  (magit-status-mode-hook . my/show-paren-local-disable-mode)
  (magit-section-movement-hook . magit-hunk-maybe-recenter)
  :bind
  (:map magit-mode-map
        ("C-S-i" . #'magit-section-cycle-diffs))
  (:map magit-status-mode-map
        ("i" . magit-section-toggle)
        ("I" . magit-gitignore)))


(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))
(use-package! marginalia
  :after vertico
  :init
  (marginalia-mode -1))

(use-package! notmuch
  :config
  (setq notmuch-hello-logo nil))

(use-package! olivetti
  :init
  (define-global-minor-mode global-olivetti-mode
    olivetti-mode olivetti-mode)
  (setq-default olivetti-body-width 124))

(use-package! orderless
  :init
  (setq completion-ignore-case t)
  (setq completion-styles '(orderless)))

(use-package! org
  :init
  (setq org-directory "~/Documents/")
  :config
  (setq org-startup-folded t)
  (setq org-hide-block-startup nil)
  (setq org-priority-faces
    (quote
     ((65 . "#E05A5A")
      (66 . "#AB5353")
      (67 . "#6D3434"))))
  :bind
  (:map org-mode-map
        ("C-S-g" . org-tree-slide-mode)
        ("C-c i" . org-toggle-inline-images)
        ("C-c >" . org-do-demote)
        ("C-c <" . org-do-promote)        
        ("C-c C->" . org-demote-subtree)
        ("C-c C-<" . org-promote-subtree)
        ("C-c a" . org-archive-subtree) 
        ("C-," . nil)))

(use-package! org-tree-slide-mode
  :bind
  (:map org-tree-slide-mode-map
    ("C-S-g" . org-tree-slide-mode)
    ("<mouse-1>" . transient-noop)
    ("<mouse-3>" . transient-noop)   
    ("<down-mouse-1>" . org-tree-slide-move-next-tree)
    ("<down-mouse-3>" . org-tree-slide-move-previous-tree)))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'relative-from-project))

;; (use-package! doom-nano-modeline
;;   :init
;;   ;; (global-hide-mode-line-mode 1)
;;   ;;(doom-modeline-mode -1)
;;   (doom-nano-modeline-mode 1))

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

(use-package! spacious-padding
  :init
  (spacious-padding-mode))

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
  (vertico-buffer-mode)
  (vertico-mouse-mode -1)
  (add-to-list
   'display-buffer-alist
   '("\\*vertico"
      (display-buffer-same-window)))
  :config
  (setq vertico-posframe-border-width 3)
  (setq vertico-posframe-width 100)
  :bind
  (:map vertico-map
        ("C-o" . vertico-next-group)
        ("C-S-o" . vertico-previous-group)
        ("C-S-n" . next-history-element)
        ("C-S-p" . previous-history-element)))

(setq org-directory "~/Documents/")

(use-package! vterm
  :config
  (setq vterm-buffer-name "Term")
  (setq vterm-buffer-name-string "Term: %s")
  :bind
  (:map vterm-mode-map
        ("C-q" . nil) ; looking for a better "exit"
        ("C-S-h" . vterm-send-C-w) ; lambda?
        ("C-g" . vterm--self-insert)
        ("C-." . vterm-copy-mode)
        ("C-/" . vterm-undo)
        ("C-<" . vterm-send-C-a)
        ("C->" . vterm-send-C-e)
        ("C-j" . woman)
        ("C-v" . nil)
        ("C-o" . nil))
  (:map vterm-copy-mode-map
        ("C-." . vterm-copy-mode-done)))

(use-package! winner
  :config
  (setq winner-boring-buffers-regexp "*Minibuf-")) ;; good enough
