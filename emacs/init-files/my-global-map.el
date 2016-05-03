;; * My global map

;; ** Initialization

(defvar my/global-map (make-keymap) "my global map")
(define-minor-mode my/global-map-mode "my global map" :keymap my/global-map)
(setq-default my/global-map-mode 1)

;; ** Definition

(let ((map my/global-map))
  (define-key map (kbd "C-?") 'help-command)
  (define-key map (kbd "C-x C-h") 'help-command)

  (define-key map (kbd "C-w") 'my/kill-region-or-backward-word)
  (define-key map (kbd "C-S-w") 'kill-ring-save)
  (define-key map (kbd "C-S-y") 'yank-pop)
  (define-key map (kbd "C-x C-k") 'kill-this-buffer)
  (define-key map (kbd "C-c C-k") 'my/kill-this-buffer-and-delete-file)
  (define-key map (kbd "C-%") 'query-replace)

  (define-key map (kbd "C-h") (kbd "<backspace>"))
  (define-key map (kbd "C-S-h") (kbd "C-<backspace>"))
  (define-key map (kbd "C-S-d") 'kill-word)

  (define-key map (kbd "C-v") 'my/scroll-up)
  (define-key map (kbd "M-v") 'my/scroll-down)
  (define-key map (kbd "C-S-v") 'my/scroll-down)

  (define-key map (kbd "C-;") 'my/eshell)
  (define-key map (kbd "C-:") 'execute-extended-command)
  (define-key map (kbd "C-!") 'eshell-command)
  (define-key map (kbd "C-`") 'rename-buffer)

  (define-key map (kbd "C-'") 'my/select-by-step)
  (define-key map (kbd "C-j") 'my/toggle-letter-case)

  (define-key map (kbd "C-,") 'backward-word)
  (define-key map (kbd "C-.") 'forward-word)
  (define-key map (kbd "C-S-b") 'backward-word)
  (define-key map (kbd "C-S-f") 'forward-word)
  (define-key map (kbd "C-<") 'beginning-of-buffer)
  (define-key map (kbd "C->") 'end-of-buffer)

  (define-key map (kbd "<C-tab>") 'next-buffer)
  (define-key map (kbd "<C-iso-lefttab>") 'previous-buffer)

  (define-key map (kbd "C-S-l") 'goto-line)

  (define-key map (kbd "C-#") 'my/comment-or-uncomment-line-or-region)

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

  (define-key map (kbd "C-S-p") 'my/move-line-or-region-above)
  (define-key map (kbd "C-S-n") 'my/move-line-or-region-below)

  (define-key map (kbd "C-c a") 'org-agenda)
  (define-key map (kbd "C-c l") 'org-store-link)

  (define-key map (kbd "C-c s") 'magit-status)

  (define-key map [C-f1] 'my/show-absolute-buffer-file-path))
