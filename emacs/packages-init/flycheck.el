;; * Flycheck

(my/ensure-package-installed 'flycheck)

(add-hook 'prog-mode-hook 'flycheck-mode)
