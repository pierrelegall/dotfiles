;; isearch

(setq-default lazy-highlight-initial-delay 0)

(define-key isearch-mode-map (kbd "<backspace>") 'isearch-del-char)
(define-key isearch-mode-map (kbd "C-h") 'isearch-del-char)
(define-key isearch-mode-map (kbd "C-S-h") (kbd "C-<backspace>")) ; does not work
