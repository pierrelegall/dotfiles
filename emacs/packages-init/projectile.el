;; * Projectile

(my/ensure-package-installed 'projectile)
(my/ensure-package-installed 'helm-projectile)

(require 'projectile)
(projectile-mode)

(setq projectile-use-git-grep t)

;; ** Actions

(setq projectile-switch-project-action (lambda () (projectile-ibuffer 0)))

;; ** Mode line

(setq projectile-mode-line
      '(:eval (if (projectile-project-p)
                  (format " [%s]" (projectile-project-name)) "")))

;; ** Behavior overrided

(defun projectile-relevant-known-projects () projectile-known-projects)
(defun projectile-relevant-open-projects () (projectile-open-projects))

;; ** Keybindings

(let ((map projectile-mode-map))
  (define-key map (kbd "C-c p g") 'helm-projectile-grep))

;; ** Helm

(setq projectile-completion-system 'helm)
