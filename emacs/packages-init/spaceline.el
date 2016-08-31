;; * Spaceline

(require 'spaceline-config)

;; ** Theme

(spaceline-emacs-theme)

;; ** Customization

(spaceline-toggle-buffer-size-off)
(spaceline-toggle-minor-modes-off)
(spaceline-toggle-line-column-off)
(spaceline-toggle-buffer-encoding-abbrev-off)

(spaceline-toggle-version-control-on)
;;(spaceline-toggle-projectile-root-on) ; doesn't work
;;(spaceline-toggle-flycheck-warning-on) ; doesn't work

;; Anzu case

(setq anzu-cons-mode-line-p nil)
