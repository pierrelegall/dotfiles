;; * Projectile

(require 'projectile)
(projectile-global-mode)

;; ** Keybindings

(let ((map projectile-mode-map))
  (define-key map (kbd "C-c p g") 'helm-projectile-grep))

;; ** Helm

(setq projectile-completion-system 'helm)
(helm-projectile-on)
