;; * Diff HL

(my/ensure-package-installed 'diff-hl)

(global-diff-hl-mode)
(diff-hl-flydiff-mode)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; ** Map

(let ((map my/global-map))
  (define-key map (kbd "C-<f11>") 'diff-hl-mode))
