;; * Magit

(setq magit-diff-refine-hunk `all)

;; ** Map

(let ((map my/global-map))
  (define-key map (kbd "C-c g s") 'magit-status)
  (define-key map (kbd "C-c g d") 'magit-diff-buffer-file)
  (define-key map (kbd "C-c g l") 'magit-log-all))
