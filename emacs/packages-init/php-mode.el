;; PHP mode

(my/ensure-package-installed 'php-mode)

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
