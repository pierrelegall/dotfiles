;; * Diff HL

(global-diff-hl-mode)
(diff-hl-margin-mode)
(diff-hl-flydiff-mode)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
