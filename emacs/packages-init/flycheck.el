;; * Flycheck

(my/ensure-package-installed 'flycheck)

(add-hook 'prog-mode-hook 'flycheck-mode)

(setq flycheck-display-errors-delay 100) ; workaround to disable it
