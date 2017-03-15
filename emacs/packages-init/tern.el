;; * Tern

(my/ensure-package-installed 'tern)
(my/ensure-package-installed 'company-tern)

(add-hook 'js-mode-hook 'tern-mode)
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js3-mode-hook 'tern-mode)

(add-to-list 'company-backends 'company-tern)
