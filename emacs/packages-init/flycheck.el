;; * Flycheck

(my/ensure-package-installed 'flycheck)

(add-hook 'prog-mode-hook 'flycheck-mode)

(setq flycheck-indication-mode nil)
(setq flycheck-display-errors-delay 100) ; workaround to disable it
