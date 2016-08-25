;; * Anzu

(require 'anzu)
(global-anzu-mode)

;; ** Maps

(define-key my/global-map (kbd "C-S-s") 'anzu-query-replace)
(define-key my/global-map (kbd "C-S-r") 'anzu-query-replace-regexp)
