;; * Web mode

(my/ensure-package-installed 'web-mode)
(my/ensure-package-installed 'company-web)

(require 'web-mode)
(require 'company-web)
(require 'company-web-html)

;; ** Extensions

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;; ** Indent and padding

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)

(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-block-padding 2)

;; ** Auto

(setq web-mode-enable-auto-indentation t)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)

;; ** Company

(add-hook 'web-mode-hook (lambda ()
                           (set (make-local-variable 'company-backends)
                                '(company-web-html))))
