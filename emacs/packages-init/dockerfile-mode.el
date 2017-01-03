;; Dockerfile mode

(my/ensure-package-installed 'dockerfile-mode)

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
