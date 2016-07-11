;; * Term mode

(setq term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-y" "<ESC>"))

(setq term-bind-key-alist
  '(("C-c C-c" . term-interrupt-subjob)
    ("C-g" . term-interrupt-subjob)
    ("C-q" . term-send-raw)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("C-h" . term-send-backspace)
    ("C-p" . term-send-up)
    ("C-n" . term-send-down)
    ("C-y" . term-paste)
    ("C-r" . term-send-reverse-search-history)
    ("C-S-d" . term-send-forward-kill-word) ; x
    ("C-S-h" . term-send-backward-kill-word) ; ~
    ("C-S-f" . term-send-forward-word) ; x
    ("C-S-b" . term-send-backward-word) ; x
    ("C-{" . term-line-mode)))

(add-hook 'term-mode-hook
          (lambda ()
            (local-set-key (kbd "C-{") 'term-char-mode)))
