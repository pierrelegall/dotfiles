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
(setq doom-theme 'doom-ayu-dark)

(custom-set-faces!
  '(line-number :foreground "#353a3f")
  '(line-number-current-line :foreground "#858a8f")
  '(helm-selection :background "#1d2027")
  '(diff-refine-added :inverse-video nil)
  '(region :background "#1d2027")
  '(isearch :background "#1d2027" :inherit t)
  '(treemacs-file-face :inherit nil)
  '(treemacs-directory-face :inherit nil)
  '(treemacs-marked-file-face :inherit nil)
  '(treemacs-tags-face :inherit nil))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-14"))
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 90))
;(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "C-h") (kbd "<backspace>"))
(global-set-key (kbd "C-S-h") (kbd "C-<backspace>"))

(global-set-key (kbd "C-x i") 'indent-for-tab-command)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-v") (lambda () (interactive) (scroll-up-command 5)))
(global-set-key (kbd "C-S-v") (lambda () (interactive) (scroll-down-command 5)))
(global-set-key (kbd "C-S-f") 'forward-word)
(global-set-key (kbd "C-S-b") 'backward-word)
(global-set-key [remap kill-region] 'kill-ring-save)
(global-set-key [remap kill-ring-save] 'kill-region)
(global-set-key (kbd "C-S-w") 'kill-ring-save)
(global-set-key (kbd "C-S-y") #'helm-show-kill-ring)
(global-set-key (kbd "C-S-l") 'visual-line-mode)

(global-set-key (kbd "C-x O") 'my/switch-to-minibuffer)
(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-x C-k") 'my/kill-this-buffer)
(global-set-key (kbd "C-q") 'my/kill-this-buffer)
(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-.") 'er/contract-region)
(global-set-key (kbd "C-0") 'doom/reset-font-size)
(global-set-key (kbd "C--") 'doom/decrease-font-size)
(global-set-key (kbd "C-=") 'doom/increase-font-size)

(setq shift-select-mode nil)
(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)
(setq scroll-margin 5)

(global-visual-line-mode)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
(remove-hook 'doom-first-buffer-hook #'show-paren-mode)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'server-switch-hook #'raise-frame)

;(set-frame-parameter nil 'alpha '(95 . 50))
;(add-to-list 'default-frame-alist '(alpha . 95))

(setq doom-leader-alt-key "C-t")

(map! :leader
      "m" #'my/switch-to-minibuffer
      "h" #'help-command
      "h h" #'+lookup/documentation
      "<SPC> "#'execute-extended-command
      "C-t" #'switch-to-buffer
      "p" #'projectile-command-map
      "v v" #'magit-status
      "v RET" #'magit-status-here
      "b" #'helm-buffers-list
      "C-k" #'my/kill-this-buffer
      "0" #'text-scale-adjust
      "-" #'text-scale-decrease
      "=" #'text-scale-increase
      "w" #'winner-undo
      "W" #'winner-redo
      "=" #'text-scale-adjust
      "r" #'recentf-open-files
      "R" #'rename-buffer
      "<" #'treemacs-select-window)

(map! :map prog-mode-map
      "C-i" 'company-complete)

(map! :map company-active-map
      "C-i" 'company-complete-selection
      "C-h" 'backward-delete-char-untabify
      "RET" nil)

(map! :map helm-map
      "C-h" nil
      "C-i" #'helm-complete-file-name-at-point
      "C-<SPC>" #'helm-execute-persistent-action
      "C-<" #'helm-beginning-of-buffer
      "C->" #'helm-end-of-buffer
      "C-v" #'minibuffer-scroll-up-command
      "C-S-v" #'minibuffer-scroll-down-command
      "C-S-p" #'previous-history-element
      "C-S-n" #'next-history-element)

(map! :map helm-occur-map
      "C-r" #'helm-previous-line
      "C-s" #'helm-next-line)

(map! :map isearch-mode-map
      "C-i" #'helm-occur-from-isearch)

(map! :map projectile-command-map
      "g" #'helm-projectile-grep)

(map! :map magit-gitflow-mode-map
      "C-f" nil)

(map! :map magit-status-mode-map
      "i" #'magit-section-toggle
      "I" #'magit-gitignore)

(map! :map treemacs-mode-map
      "i" #'treemacs-TAB-action)

(map! :map vterm-mode-map
      "C-o" nil
      "C-q" nil)

(use-package! beacon
  :init
  (beacon-mode)
  :config
  (setq beacon-size 6)
  (setq beacon-blink-when-window-scrolls nil)
  (setq beacon-blink-when-window-changes t)
  (setq beacon-blink-when-point-moves t))

(use-package! company
  :init
  (setq company-idle-delay nil))

(use-package! diff-hl
  :init
  (global-diff-hl-mode t)
  (diff-hl-flydiff-mode))

(use-package! eldoc
  :init
  (setq eldoc-echo-area-use-multiline-p nil))

(use-package! doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)

  ;(doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package! helm
  :config
  (setq helm-ff-skip-git-ignored-files t))

(use-package isearch
  :custom
  (isearch-wrap-pause nil)
  :config
  (defun my/isearch-post-action ()
    (unless (isearch-fail-pos) (recenter)))
  :hook
  (isearch-update-post . my/isearch-post-action))

(use-package! projectile
  :init
  (setq projectile-enable-caching nil)
  (setq projectile-switch-project-action 'magit-status))

(use-package! lsp
  :init
  (setq lsp-keymap-prefix "C-t l")
  (setq lsp-ui-doc-enable nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-signature-render-documentation nil)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  :config
  (setq lsp-elixir-suggest-specs nil)
  (setq lsp-enable-snippet nil)
  (add-to-list 'exec-path "elixir-ls"))

(use-package! lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t))
  ;:config
  ;(add-to-list 'lsp-tailwindcss-major-modes 'elixir-mode)
  ;(add-to-list 'lsp-language-id-configuration '(".*\\.ex$" . "html")))

(use-package! magit
  :init
  ;(advice-add 'magit-set-header-line-format :override #'ignore) ; need for nano-modeline?
  (setq magit-diff-refine-hunk 'all))

(use-package! nano-modeline
  :init
  ;(doom-modeline-mode -1)
  (nano-modeline-mode))

(use-package! treemacs
  :init
  ;(treemacs-load-all-the-icons-with-workaround-font "Ubuntu Mono")
  ;(treemacs-follow-mode +1)
  (setq treemacs-project-follow-cleanup t))

(setq doom-variable-pitch-font (font-spec :family "Ubuntu Mono" :size 14))
(setq doom-themes-treemacs-enable-variable-pitch nil)

; (add-hook 'helm-after-action-hook 'recenter)
