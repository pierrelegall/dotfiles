;; * Markdown mode

(my/ensure-package-installed 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
