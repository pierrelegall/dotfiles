;; avy

(my/ensure-package-installed 'avy)

(let ((map my/global-map))
  (define-key map (kbd "C-j") 'avy-goto-word-1))
