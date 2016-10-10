;; * RestClient

(my/ensure-package-installed 'restclient)

(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))
