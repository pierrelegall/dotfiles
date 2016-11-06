;; * JS Mode

(my/ensure-package-installed 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js-indent-level 2)
(setq js2-strict-missing-semi-warning nil)
