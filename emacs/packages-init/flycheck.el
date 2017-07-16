;; * Flycheck

(my/ensure-package-installed 'flycheck)

(add-hook 'prog-mode-hook 'flycheck-mode)

(setq-default flycheck-emacs-lisp-load-path 'inherit)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(setq flycheck-indication-mode nil)
(setq flycheck-display-errors-delay 100) ; workaround to disable it

(let ((map my/global-map))
  (define-key map [f10] 'flycheck-mode))
