;; elixir-mode

(my/ensure-package-installed 'elixir-mode)
(my/ensure-package-installed 'alchemist)

(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-mode))
