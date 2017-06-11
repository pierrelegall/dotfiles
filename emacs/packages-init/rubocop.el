;; RuboCop

(my/ensure-package-installed 'rubocop)

(add-hook 'ruby-mode-hook #'rubocop-mode)
