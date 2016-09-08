;; * Spaceline

(require 'spaceline-config)

;; ** Theme

(spaceline-emacs-theme '(projectile-root))

;; ** Customization

(spaceline-toggle-buffer-size-off)
(spaceline-toggle-minor-modes-off)
(spaceline-toggle-line-column-off)
(spaceline-toggle-buffer-encoding-abbrev-off)
(spaceline-toggle-version-control-off)

;;(spaceline-toggle-flycheck-warning-off) ; doesn't work

;; Anzu case

(setq anzu-cons-mode-line-p nil)
