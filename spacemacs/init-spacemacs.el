;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     elixir
     emacs-lisp
     erlang
     git
     helm
     html
     javascript
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ruby
     syntax-checking
     typescript
     version-control
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     beacon
     emojify
     projectile
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     fill-column-indicator
     paradox
     magit-gitflow
     smartparens
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "C-t"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-S-t"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq spacemacs-theme-comment-bg nil)
  (setq spacemacs-theme-org-height nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Load my functions
  (my/load-my-functions)
  ;; Global behavior
  (delete-selection-mode 1)
  (setq shift-select-mode nil)
  (setq x-select-enable-clipboard t)
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
  (setq default-tab-width 2)
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq hl-paren-colors '("Springgreen3"))
  (setq show-trailing-whitespace nil)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (global-visual-line-mode)
  ;; Scrolling
  (setq scroll-margin 2)
  (setq scroll-step 1)
  (setq mouse-wheel-follow-mouse (quote t))
  (setq mouse-wheel-mode t)
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-scroll-amount (quote (3 ((shift) . 1))))
  (defun my/scroll-up ()
    (interactive)
    (scroll-up 5))
  (defun my/scroll-down ()
    (interactive)
    (scroll-down 5))
  ;; Helm
  (require 'helm-projectile)
  (setq helm-mini-default-sources '(helm-source-buffers-list
                                    helm-source-projectile-files-list
                                    helm-source-recentf
                                    helm-source-buffer-not-found))
  ;; Key bindings
  (global-set-key (kbd "C-;") 'helm-M-x)
  (spacemacs/set-leader-keys "C-t" 'helm-mini)
  (global-set-key (kbd "C-o") 'other-window)
  (global-set-key (kbd "C-v") 'my/scroll-up)
  (global-set-key (kbd "M-v") 'my/scroll-down)
  (global-set-key (kbd "C-S-v") 'my/scroll-down)
  (global-set-key (kbd "C-x C-k") 'spacemacs/kill-this-buffer)
  (global-set-key (kbd "C-w") 'kill-ring-save)
  (global-set-key (kbd "M-w") 'kill-region)
  (global-set-key (kbd "C-<") 'beginning-of-buffer)
  (global-set-key (kbd "C->") 'end-of-buffer)
  (global-set-key (kbd "C-S-l") 'visual-line-mode)
  (global-set-key (kbd "C-.") 'company-complete)
  (global-set-key (kbd "C-,") 'er/expand-region)
  (global-set-key (kbd "C-S-n") 'forward-paragraph)
  (global-set-key (kbd "C-S-p") 'backward-paragraph)
  (global-set-key (kbd "C-S-f") 'forward-word)
  (global-set-key (kbd "C-S-b") 'backward-word)
  (global-set-key (kbd "C-S-b") 'backward-word)
  (global-set-key (kbd "C-h") (kbd "<backspace>"))
  (global-set-key (kbd "C-S-h") (kbd "C-<backspace>"))
  (global-set-key (kbd "C-#") 'comment-dwim)
  (global-set-key (kbd "C-=") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out)
  ;; Company
  (require 'company)
  (require 'helm-company)
  (unbind-key (kbd "C-f") company-active-map)
  (unbind-key (kbd "C-m") company-active-map)
  (define-key company-active-map (kbd "TAB") #'company-complete-selection)
  (define-key company-active-map (kbd "C-h") #'backward-delete-char-untabify)
  (define-key company-active-map (kbd "C-.") #'helm-company)
  (define-key company-active-map (kbd "C-?") #'company-show-doc-buffer)
  ;; (define-key helm-company-map (kbd "C-?") #'helm-company-run-show-doc-buffer) ; does not work
  ;; Eshell
  (require 'vc-git)
  (setq eshell-banner-message ";; Welcome to the Emacs shell\n")
  (setq eshell-cmpl-ignore-case t)
  (setq eshell-prompt-regexp "^[#$] ")
  (setq eshell-prompt-function 'my/eshell-prompt-function)
  (defun my/eshell-prompt-function ()
    (concat
     (propertize "\n")
     (propertize "[" 'face `(:foreground "dodger blue" :weight bold))
     (propertize (user-login-name) 'face `(:foreground "#d23681" :weight bold))
     (propertize "@" 'face `(:foreground "dodger blue" :weight bold))
     (propertize (system-name) 'face `(:foreground "#d23681" :weight bold))
     (propertize " ")
     (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground "#2aa097" :weight bold))
     (when (vc-git-root (eshell/pwd))
       (concat
        (propertize " ")
        (propertize (format "(%s)" (car (vc-git-branches))) 'face `(:foreground "#ffff55" :weight bold))))
     (propertize "]" 'face `(:foreground "dodger blue" :weight bold))
     (propertize "\n")
     (if (= (user-uid) 0)
         (propertize "#" 'face `(:foreground "orange red"))
       (propertize "$" 'face `(:foreground "medium sea green" :weight bold)))
     (propertize " ")))
  (defun eshell/clear ()
    "Clear the eshell buffer."
    (let ((inhibit-read-only t))
      (erase-buffer)))
  (defun eshell/e (filename &optional wildcards)
    "Find file alias"
    (find-file filename wildcards))
  (defun pcomplete/sudo ()
    "Make the sudo command completion compatible."
    (let ((prec (pcomplete-arg 'last -1)))
      (cond ((string= "sudo" prec)
             (while (pcomplete-here*
                     (funcall pcomplete-command-completion-function)
                     (pcomplete-arg 'last) t))))))
  ;; Powerline
  (setq powerline-default-separator 'bar)
  (setq spaceline-separator-dir-left '(left . left))
  (setq spaceline-separator-dir-right '(right . right))
  ;; Projectile
  (setq projectile-use-git-grep t)
  (setq projectile-switch-project-action (lambda () (projectile-ibuffer 0)))
  (defun projectile-relevant-known-projects () projectile-known-projects)
  (defun projectile-relevant-open-projects () (projectile-open-projects))
  (spacemacs/set-leader-keys "pg" 'helm-projectile-grep)
  ;; Magit
  (setq magit-diff-refine-hunk nil)
  (setq git-magit-status-fullscreen t)
  (remove-hook 'magit-section-highlight-hook 'magit-section-highlight)
  (remove-hook 'magit-section-highlight-hook 'magit-diff-highlight)
  (defun my/magit-diff-master-head ()
    "magit-diff master..HEAD"
    (interactive)
    (magit-diff "master..HEAD"))
  (spacemacs/set-leader-keys "gl" 'magit-log-head)
  (spacemacs/set-leader-keys "gL" 'magit-log-all)
  ;; Beacon
  (beacon-mode 1)
  ;; Flycheck
  (setq flycheck-indication-mode nil)
  ;; Miscellaneous
  (global-set-key (kbd "C-'") 'my/toggle-letter-case)
  (global-set-key (kbd "C-`") 'my/show-buffer-visiting-file)
  ;; Javascript
  (defun my/use-eslint-from-node-modules ()
    (let ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 (lambda (dir)
                   (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" dir)))
                     (and eslint (file-executable-p eslint)))))))
      (when root
        (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" root)))
          (setq-local flycheck-javascript-eslint-executable eslint)))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (add-hook 'js2-mode-hook #'js2-mode-hide-warnings-and-errors)
  )

(defun my/load-my-functions ()
  "Define my interactive functions."
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
    "Like `comment-or-uncomment-region' but if there is no active region, the line is the region."
    (interactive)
    (if (region-active-p)
        (comment-or-uncomment-region (region-beginning)
                                     (region-end))
      (comment-or-uncomment-region (line-beginning-position)
                                   (line-end-position))))
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
  )
