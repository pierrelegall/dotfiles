;; * Flycheck

(my/ensure-package-installed 'flycheck)

(add-hook 'prog-mode-hook 'flycheck-mode)

(setq-default flycheck-emacs-lisp-load-path 'inherit)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(setq flycheck-indication-mode nil)
(setq flycheck-display-errors-delay 100) ; workaround to disable it

(let ((map my/global-map))
  (define-key map [f10] 'flycheck-mode))

(defun my/use-eslint-from-node-modules ()
  (let ((root (locate-dominating-file
               (or (buffer-file-name) default-directory)
               (lambda (dir)
                 (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" dir)))
                  (and eslint (file-executable-p eslint)))))))
    (when root
      (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" root)))
        (setq-local flycheck-javascript-eslint-executable eslint)))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
