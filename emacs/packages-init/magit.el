;; * Magit

(my/ensure-package-installed 'magit)

(setq magit-diff-refine-hunk `all)

;; ** Map

(let ((map my/global-map))
  (define-key map (kbd "C-c g s") 'magit-status)
  (define-key map (kbd "C-c g f") 'magit-file-popup)
  (define-key map (kbd "C-c g a") 'magit-file-popup)
  (define-key map (kbd "C-c g d") 'magit-diff-buffer-file)
  (define-key map (kbd "C-c g l") 'magit-log-head)
  (define-key map (kbd "C-c g L") 'magit-log-all))
