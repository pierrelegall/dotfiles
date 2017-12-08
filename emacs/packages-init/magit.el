;; * Magit

(my/ensure-package-installed 'magit)

(setq magit-diff-refine-hunk nil)

(remove-hook 'magit-section-highlight-hook 'magit-section-highlight)
(remove-hook 'magit-section-highlight-hook 'magit-diff-highlight)

(defun my/magit-diff-master-head ()
  "magit-diff master..HEAD"
  (interactive)
  (magit-diff "master..HEAD"))

;; ** Map

(let ((map my/global-map))
  (define-key map (kbd "C-c g s") 'magit-status)
  (define-key map (kbd "C-c g f") 'magit-file-popup)
  (define-key map (kbd "C-c g a") 'magit-file-popup)
  (define-key map (kbd "C-c g d") 'magit-diff-buffer-file)
  (define-key map (kbd "C-c g l") 'magit-log-head)
  (define-key map (kbd "C-c g L") 'magit-log-all))
