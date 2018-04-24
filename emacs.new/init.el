(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (setq-default indicate-empty-lines t)
  (setq inhibit-splash-screen t)
  (setq inhibit-startup-screen t)
  (setq ring-bell-function (lambda () nil))
  (add-to-list 'default-frame-alist '(font . "Monaco-13"))
  (add-to-list 'default-frame-alist '(height . 40))
  (add-to-list 'default-frame-alist '(width . 100))
  (setq auto-save-default nil)
  (setq make-backup-files nil)
  (setq backup-by-copying t)
  (setq backup-directory-alist '(("." . "~/.emacs-backups")))
  (setq custom-file "~/.emacs.d/custom-file.el")
  (add-hook 'write-file-hooks 'delete-trailing-whitespace)
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq-default indent-tabs-mode nil)
  (setq default-tab-width 2)
  (setq-default message-log-max nil)
  (delete-selection-mode t)
  (show-paren-mode t)
  (setq shift-select-mode nil)
  (setq x-select-enable-clipboard t)
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
  (setq-default truncate-lines t)
  (setq mouse-wheel-follow-mouse (quote t))
  (setq mouse-wheel-mode t)
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-scroll-amount (quote (3 ((shift) . 1))))
  (add-hook 'prog-mode-hook #'linum-mode)
  (global-auto-revert-mode)
  (global-set-key (kbd "C-h") (kbd "<backspace>"))
  (global-set-key (kbd "C-S-h") (kbd "C-<backspace>"))
  (global-set-key (kbd "C-x C-k") 'kill-this-buffer)
  (global-set-key (kbd "C-h") 'backward-delete-char-untabify) ; remaping is better
  (global-set-key (kbd "C-;") 'comment-dwim)
  (global-set-key (kbd "C-S-l") 'visual-line-mode)
  (global-set-key (kbd "C-<") 'beginning-of-buffer)
  (global-set-key (kbd "C->") 'end-of-buffer)
  ;;(global-set-key (kbd "C-+") 'text-scale-increase)
  ;;(global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key [remap kill-region] 'kill-ring-save)
  (global-set-key [remap kill-ring-save] 'kill-region)
  (define-prefix-command 'leader-key-map)
  (global-set-key (kbd "C-t") 'leader-key-map)
  (define-key leader-key-map (kbd "<SPC>") 'execute-extended-command)
  (define-key leader-key-map (kbd "r") 'rectangle-mark-mode))

(use-package alchemist
  :diminish alchemist-mode)

(use-package anzu
  :diminish anzu-mode
  :config
  (global-anzu-mode))

(use-package beacon
  :diminish beacon-mode
  :config
  (beacon-mode))

(use-package company
  :diminish company-mode
  :bind
  (:map company-mode-map
        ("C-o" . company-complete))
  (:map company-active-map
        ("C-h" . backward-delete-char-untabify)
        ("TAB" . company-complete-selection)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-?" . company-show-doc-buffer))
  :init
  (setq company-idle-delay nil)
  (setq company-tooltip-align-annotations t)
  (add-hook 'prog-mode-hook #'company-mode)
  :config
  (company-flx-mode t))

(use-package company-flx)

(use-package counsel
  :diminish counsel-mode
  :bind
  (:map leader-key-map
        ("s f" . counsel-locate)
        ("d a" . counsel-apropos)
        ("d k" . counsel-descbinds)
        ("d v" . counsel-describe-variable)
        ("d f" . counsel-describe-function)
        ("d F" . counsel-describe-face))
  :init
  (setq counsel-projectile-switch-project-action 'counsel-projectile-switch-project-action-vc))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package default-text-scale
  :config
  (default-text-scale-mode))

(use-package diff-hl
  :init
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode))

(use-package diminish
  :config
  (diminish 'auto-revert-mode))

(use-package editorconfig
  :diminish editorconfig-mode
  :config
  (editorconfig-mode t))

(use-package elixir-mode
  :mode "\\.ex\\'"
  :interpreter "elixir")

(use-package expand-region
  :bind
  (("C-," . 'er/expand-region)))

(use-package flycheck
  :diminish flycheck-mode
  :init
  (setq flycheck-indication-mode nil)
  (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package git-timemachine
  :bind
  (:map leader-key-map
        ("v t" . git-timemachine)))

(use-package js2-mode
  :mode "\\.js\\'"
  :interpreter "node"
  :init
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)
  (defun my/use-eslint-from-node-modules ()
    (let* ((root
            (locate-dominating-file (or (buffer-file-name) default-directory)
                                    "node_modules"))
           (eslint
            (and root (expand-file-name "node_modules/.bin/eslint" root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  :config
  (js2-mode-hide-warnings-and-errors))

(use-package ivy
  :diminish ivy-mode
  :bind
  (:map leader-key-map
        ("i" . ivy-resume))
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  :config
  (ivy-mode))

(use-package langtool
  :bind
  (:map leader-key-map
        ( "l l" . langtool-check)
        ( "l d" . langtool-check-done)
        ( "l s" . langtool-switch-default-language)
        ( "l m" . langtool-show-message-at-point)
        ( "l c" . langtool-correct-buffer))
  :init
  (setq langtool-language-tool-jar "~/.bin/languagetool/languagetool-commandline.jar")
  (setq langtool-default-language "en-US")
  (setq langtool-mother-tongue "fr"))

(use-package magit
  :bind
  (:map leader-key-map
        ("v v" . magit-status)
        ("v s" . magit-status)
        ("v b" . magit-blame)
        ("v l" . magit-log-current)
        ("v L" . magit-log-all))
  :init
  (setq magit-display-buffer-function 'my/magit-display-buffer-function)
  (setq magit-diff-refine-hunk nil)
  (remove-hook 'magit-section-highlight-hook 'magit-section-highlight)
  (remove-hook 'magit-section-highlight-hook 'magit-diff-highlight)
  (defun my/magit-display-buffer-function (buffer)
    (display-buffer buffer '(display-buffer-same-window)))
  (defun my/magit-diff-master-head ()
    (interactive)
    (magit-diff "master..HEAD"))
  (defun my/magit-diff-develop-head ()
    (interactive)
    (magit-diff "develop..HEAD")))

(use-package org
  :bind
  (:map leader-key-map
        ("o c" . org-goto-calendar)
        ("o t" . org-todo-list))
  :init
  (setq org-agenda-files '("~/Documents/Notes.org"))
  (setq org-agenda-todo-ignore-scheduled t)
  (setq org-todo-keywords '((sequence "TODO(t)"
                                      "MAYBE(m)"
                                      "WAITING(w)"
                                      "|" "DONE(d)")))
  :config
  (unbind-key "C-," org-mode-map))

(use-package projectile
  :bind
  (:map leader-key-map
        ("p p" . projectile-switch-project)
        ("p d" . projectile-dired)
        ("p f" . projectile-find-file)
        ("p F" . projectile-find-file-in-known-projects) ; not counsel :(
        ("p g" . projectile-grep)
        ("p t" . treemacs-projectile)
        ("p v" . projectile-vc))
  :init
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-use-git-grep t)
  (setq projectile-keymap-prefix (kbd "C-t p"))
  (setq projectile-mode-line
      '(:eval (if (projectile-project-p)
                  (format " [%s]" (projectile-project-name))
                ""))))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package restclient
  :mode "\\.http\\'"
  :config
  (restclient-mode))

(use-package rotate
  :bind
  ("C-{" . rotate-window)
  ("C-}" . rotate-layout))

(use-package shift-number
  :bind
  ("C-+" . 'shift-number-up)
  ("C--" . 'shift-number-down))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode t))

(use-package sudo-edit)

(use-package swiper
  :bind
  (:map isearch-mode-map
        ("TAB" . swiper-from-isearch))
  (:map swiper-map
        ("C-s" . ivy-next-line)
        ("C-r" . ivy-previous-line)))

(use-package treemacs
  :bind
  (:map treemacs-mode-map
        ("C-h" . treemacs-toggle-show-dotfiles))
  :config
  (add-hook 'treemacs-mode-hook #'treemacs-toggle-fixed-width)
  (treemacs-follow-mode)
  (treemacs-filewatch-mode)
  (treemacs-git-mode 'extended))

(use-package treemacs-projectile)

(use-package undo-tree
  :diminish undo-tree-mode
  :bind
  (:map undo-tree-visualizer-mode-map
        ("RET" . kill-this-buffer))
  :init
  (global-undo-tree-mode))

(use-package zerodark-theme
  :config
  (load-theme 'zerodark t)
  (zerodark-setup-modeline-format))

(use-package zoom
  :disabled t
  :diminish zoom-mode
  :init
  (setq zoom-ignored-major-modes '(treemacs-mode))
  :config
  (zoom-mode t))
