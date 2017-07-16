;; Multi term

(my/ensure-package-installed 'multi-term)

(let ((map my/global-map))
  (define-key map (kbd "C-x T") 'multi-term)
  (define-key map (kbd "C-x t") 'multi-term-dedicated-toggle))
