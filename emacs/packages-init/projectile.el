;; * Projectile

(my/ensure-package-installed 'projectile)

(require 'projectile)
(projectile-global-mode)

;; ** Actions

(setq projectile-switch-project-action 'projectile-dired)

;; ** Keybindings

(let ((map projectile-mode-map))
  (define-key map (kbd "C-c p g") 'helm-projectile-grep))

;; ** Helm

(setq projectile-completion-system 'helm)
