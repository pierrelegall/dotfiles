;; * Rainbow delimiters

(my/ensure-package-installed 'rainbow-delimiters)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
