;; highlight indent guides

(my/ensure-package-installed 'highlight-indent-guides)

(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?\¦)

(add-hook 'emacs-lisp-mode-hook 'highlight-indent-guides-mode)
(add-hook 'lisp-mode-hook 'highlight-indent-guides-mode)
