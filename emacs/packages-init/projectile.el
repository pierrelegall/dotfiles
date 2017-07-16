;; * Projectile

(my/ensure-package-installed 'projectile)
(my/ensure-package-installed 'helm-projectile)

(require 'projectile)
(projectile-global-mode)

;; ** Actions

(setq projectile-switch-project-action 'neotree-projectile-action)

;; ** Behavior overrided

(defun projectile-relevant-known-projects () projectile-known-projects)
(defun projectile-relevant-open-projects () (projectile-open-projects))

;; ** Keybindings

(let ((map projectile-mode-map))
  (define-key map (kbd "C-c p g") 'helm-projectile-grep))

;; ** Helm

(setq projectile-completion-system 'ivy)
