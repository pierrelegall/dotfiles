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
(setq doom-theme 'doom-dark+)

(pixel-scroll-precision-mode)
(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

(setq-default cursor-type 'bar)
(blink-cursor-mode t)
(setq blink-cursor-interval 0.1)
(setq blink-cursor-blinks 2)
(setq blink-cursor-delay 0.25)
(setq show-paren-delay 0.05)
(show-paren-mode -1)

(custom-set-faces!
  '(font-lock-comment-face
    :foreground "#4d4d4d")
  '(cursor
    :background "#0ff142")
  '(show-paren-match
    :inverse-video t)
  '(doom-nano-modeline-inactive-face
    :background "#222222"
    :foreground "#8c3fa0")
  '(line-number
    :foreground "#353a3f")
  '(line-number-current-line
    :foreground "#858a8f")
  '(magit-diff-hunk-heading
    :background nil
    :foreground "#4a425c")
  '(magit-diff-hunk-headin
    g-highlight
    :background nil
    :foreground "#dbb7ff")
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
    :inherit org-document-info-keyword))

(fringe-mode '(4 . 4))
(setq scroll-bar-adjust-thumb-portion nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq indicate-empty-lines nil)
(setq frame-title-format '("Emacs"))

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

(defun my/expand-region (arg)
  (interactive "p")
  (cond ((> arg 1) (er/contract-region 1))
        (t         (er/expand-region 1))))

(add-to-list 'default-frame-alist '(font . "Cascadia Mono-12"))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq server-raise-frame t)

(global-set-key (kbd "C-\"") #'consult-imenu-multi)
(global-set-key (kbd "C-S-n") #'forward-paragraph)
(global-set-key (kbd "C-S-p") #'backward-paragraph)
(global-set-key (kbd "C-{") #'my/move-line-up)
(global-set-key (kbd "C-è") #'my/move-line-down)
(global-set-key (kbd "C-h") (kbd "<backspace>"))
(global-set-key (kbd "C-S-h") (kbd "C-<backspace>"))
(global-set-key (kbd "C-x i") 'indent-for-tab-command)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-v") (cmd! (scroll-up-command 5)))
(global-set-key (kbd "C-S-v") (cmd! (scroll-down-command 5)))
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
(global-set-key (kbd "C-j") #'projectile-toggle-between-implementation-and-test)

(setq shift-select-mode nil)
(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)
(setq scroll-margin 6)
(setq-default indicate-empty-lines nil)

(setq-default tab-width 2)

(global-visual-line-mode)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
(remove-hook 'doom-first-buffer-hook #'show-paren-mode)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'corfu-mode)
(add-hook 'server-switch-hook #'raise-frame)

;;(set-frame-parameter nil 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . 95))

(setq doom-leader-alt-key "C-t")

(map! :leader
      "h" #'help-command
      ;;"h h" #'+lookup/documentation
      "h h" #'eldoc
      "x" #'consult-mode-command
      "<SPC>" #'execute-extended-command
      "C-<SPC>" #'vertico-repeat
      "C-t" #'consult-projectile
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
      "r" #'recentf-open-files
      "R" #'rename-buffer
      "<" #'treemacs-select-window
      "T" #'treemacs-narrow-to-current-file
      "e" #'consult-flycheck)

(map! :map prog-mode-map
      "C-i" 'completion-at-point)

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
  (setq corfu-preview-current nil)
  (setq corfu-quit-at-boundary nil)
  (setq corfu-cycle t)
  :bind
  (:map corfu-map
        ("?" . corfu-info-documentation)))

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
  (doom-themes-org-config))

(use-package eglot
  :init
  (setq eglot-send-changes-idle-time 0.25)
  :config
  (add-to-list 'eglot-server-programs
               '(elixir-ts-mode . ("/home/pierre/Code/lexical/_build/dev/package/lexical/bin/start_lexical.sh")))
  :hook
  (eglot-mode . flycheck-eglot-mode))

(use-package! eldoc
  :config
  (eldoc-mode -1)
  
  (setq eldoc-echo-area-use-multiline-p nil)
  (setq eldoc-echo-area-display-truncation-message t)
  (setq eldoc-echo-area-prefer-doc-buffer t)
  (setq eldoc-idle-delay 0.2))

(use-package! elixir-ts-mode
  :config
  (add-to-list 'auto-mode-alist
               '("\\.ex\\'" . elixir-ts-mode)
               '("\\.exs\\'" . elixir-ts-mode))
  :hook
  (elixir-ts-mode . exunit-mode)
  (elixir-ts-mode . eglot-ensure)
  (before-save . eglot-format))

(use-package! exunit
  :bind
  (:map exunit-mode-map
        ("C-." . 'exunit-transient))
  (:map exunit-compilation-mode-map
        ("C-o" . nil)
        ("r" . 'recompile)))

(use-package! flycheck
  :init
  (setq flycheck-indication-mode nil)
  (setq flycheck-display-errors-delay 0.2)
  (global-flycheck-mode))

(use-package flycheck-languagetool
  :init
  (setq flycheck-languagetool-server-jar nil)
  (setq flycheck-languagetool-server-port 8081)
  (setq flycheck-languagetool-server-command '("languagetool" "--http" "--port" "8080"))
  :hook
  (text-mode . flycheck-languagetool-setup))

(use-package isearch
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
  :bind
  (:map projectile-command-map
        ("g" . consult-ripgrep)))

(use-package! magit
  :config
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

(use-package! marginalia
  :after vertico
  :init
  (marginalia-mode))

(use-package! olivetti
  :init
  (define-global-minor-mode global-olivetti-mode
    olivetti-mode olivetti-mode)
  (setq-default olivetti-body-width 103)
  (global-olivetti-mode))

(use-package! orderless
  :init
  (setq completion-ignore-case t)
  (setq completion-styles '(orderless)))

(use-package! org
  :init
  (setq org-directory "~/Documents/")
  :bind
  (:map org-mode-map
        ("C-," . nil)))

(use-package! org-excalidraw
  :config
  (setq org-excalidraw-directory "~/Documents/Draws"))

(use-package! doom-nano-modeline
  :init
  (global-hide-mode-line-mode 1)
  ;;(doom-modeline-mode -1)
  (doom-nano-modeline-mode 1))

(use-package! treemacs
  :config
  ;;(treemacs-git-mode 'extended)
  ;;(treemacs-project-follow-mode) ;; vterm buffer break it :(
  (treemacs-filewatch-mode)
  (treemacs-add-and-display-current-project-exclusively)
  (treemacs-project-follow-mode)
  (setq treemacs--project-follow-delay 0.1)
  (setq doom-variable-pitch-font (font-spec :family "Cascadia Mono"))
  (setq doom-themes-treemacs-enable-variable-pitch nil)
  :bind
  (:map treemacs-mode-map
        ("i" . treemacs-TAB-action)))

(use-package! vertico
  :init
  (vertico-mode)
  (vertico-mouse-mode -1)
  :bind
  (:map vertico-map
        ("C-o" . vertico-next-group)
        ("C-S-o" . vertico-previous-group)
        ("C-S-n" . next-history-element)
        ("C-S-p" . previous-history-element)))

(setq org-directory "~/Documents/")(use-package! vterm
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
