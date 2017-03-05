;; zygospore

(my/ensure-package-installed 'zygospore)

(let ((map my/global-map))
  (define-key map (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))
