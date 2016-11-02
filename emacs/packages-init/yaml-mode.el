;; YAML mode

(my/ensure-package-installed 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)
