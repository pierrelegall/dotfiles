;; Gitconfig mode

(my/ensure-package-installed 'gitconfig-mode)

(add-to-list 'auto-mode-alist '("gitconfig\\'" . gitconfig-mode))
