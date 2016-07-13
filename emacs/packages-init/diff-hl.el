;; * Diff HL

(global-diff-hl-mode)
(diff-hl-margin-mode)
(diff-hl-flydiff-mode)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; ** Map

(let ((map my/global-map))
  (define-key map (kbd "C-<f11>") 'diff-hl-mode))
