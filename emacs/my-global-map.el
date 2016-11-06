;; * My global map

;; ** Initialization

(defvar my/global-map
  (make-keymap)
  "Personal global key-bindings.")

(define-minor-mode my/global-map-mode
  "Personal global key-bindings mode."
  :keymap my/global-map
  :global t)

(my/global-map-mode t)

;; ** Definition

(let ((map my/global-map))
  (define-key map (kbd "<mouse-3>") 'menu-bar-open)
  (define-key map (kbd "<menu>") 'menu-bar-open)

  (define-key map (kbd "C-S-u") 'negative-argument)

  (define-key map (kbd "C-x C-c") 'my/kill-frame)

  (define-key map (kbd "C-.") 'repeat)

  (define-key map (kbd "C-x C-h") 'help-command)

  (define-key map (kbd "C-S-i") 'company-complete)

  (define-key map (kbd "C-t") 'transpose-chars)
  (define-key map (kbd "C-S-t") 'transpose-words)
  (define-key map (kbd "C-<prior>") 'my/move-line-or-region-above)
  (define-key map (kbd "C-<next>") 'my/move-line-or-region-below)

  (define-key map (kbd "C-<") 'beginning-of-buffer)
  (define-key map (kbd "C->") 'end-of-buffer)

  (define-key map (kbd "C-x r") 'rectangle-mark-mode)
  (define-key map (kbd "<mouse-2>") 'rectangle-mark-mode)

  (define-key map (kbd "C-w") 'my/copy-region-or-line)
  (define-key map (kbd "C-S-w") 'kill-region)
  (define-key map (kbd "C-S-y") 'yank-pop)
  (define-key map (kbd "C-x C-k") 'my/kill-this-buffer)
  (define-key map (kbd "C-q") 'my/kill-this-buffer)

  (define-key map (kbd "C-S-a") 'backward-sentence)
  (define-key map (kbd "C-S-e") 'forward-sentence)

  (define-key map (kbd "C-S-q") 'quoted-insert)

  (define-key map (kbd "C-%") 'query-replace)

  (define-key map (kbd "C-h") (kbd "<backspace>"))
  (define-key map (kbd "C-S-h") (kbd "C-<backspace>"))
  (define-key map (kbd "C-S-d") 'kill-word)

  (define-key map (kbd "C-v") 'my/scroll-up)
  (define-key map (kbd "M-v") 'my/scroll-down)
  (define-key map (kbd "C-S-v") 'my/scroll-down)

  (define-key map (kbd "C-`") 'my/rename-buffer)

  (define-key map (kbd "<C-tab>") 'next-buffer)
  (define-key map (kbd "<C-iso-lefttab>") 'previous-buffer)

  (define-key map (kbd "C-,") 'er/expand-region)
  (define-key map (kbd "C-'") 'my/toggle-letter-case)

  (define-key map (kbd "C-S-b") 'backward-word)
  (define-key map (kbd "C-S-f") 'forward-word)

  (define-key map (kbd "C-S-g") 'goto-line)

  (define-key map (kbd "C-#") 'my/comment-or-uncomment-line-or-region)

  (define-key map (kbd "C-/") 'undo)
  (define-key map (kbd "C-?") 'redo)
  (define-key map (kbd "C-<f12>") 'revert-buffer)

  (define-key map (kbd "C-o") 'my/next-window)
  (define-key map (kbd "C-S-o") 'my/previous-window)
  (define-key map (kbd "C-x o") 'my/switch-to-minibuffer)

  (define-key map (kbd "C-S-p") 'backward-paragraph)
  (define-key map (kbd "C-S-n") 'forward-paragraph)

  (define-key map (kbd "ESC <f1>") 'emms-next)
  (define-key map (kbd "ESC ESC <f1>") 'emms-previous)
  (define-key map (kbd "ESC <f2>") 'emms-play-file)
  (define-key map (kbd "ESC <f3>") 'emms-pause)
  (define-key map (kbd "ESC <f4>") 'emms-playlist-g)

  (define-key map (kbd "C-\\") 'my/translate)

  (define-key map (kbd "C-<f1>") 'my/show-buffer-visiting-file)

  (define-key map (kbd "C-S-l") 'visual-line-mode)

  (define-key map (kbd "M-[") 'rotate-window)
  (define-key map (kbd "M-]") 'rotate-layout))

(global-set-key (kbd "C-h") (kbd "<backspace>"))
(global-set-key (kbd "C-S-h") (kbd "C-<backspace>"))
