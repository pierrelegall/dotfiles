;; switch-window

(require 'switch-window)

(setq switch-window-shortcut-style 'qwerty)
(setq switch-window-qwerty-shortcuts
      '("a" "t" "n" "d" "h" "v" "p" "l" "m"))

(let ((map my/global-map))
  (define-key map (kbd "C-o") 'switch-window)
  (define-key map (kbd "C-M-<up>") 'switch-window-mvborder-up)
  (define-key map (kbd "C-M-<down>") 'switch-window-mvborder-down)
  (define-key map (kbd "C-M-<left>") 'switch-window-mvborder-left)
  (define-key map (kbd "C-M-<right>") 'switch-window-mvborder-right))
