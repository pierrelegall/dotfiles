;; treemacs

;; TODO sort dotfiles at the end of the list
;; TODO open files on click or double click
;;      see: https://github.com/Alexander-Miller/treemacs/issues/79

(my/ensure-package-installed 'treemacs)
(my/ensure-package-installed 'treemacs-projectile)

(require 'treemacs)

(define-key treemacs-mode-map (kbd "b") 'treemacs-uproot)
(define-key treemacs-mode-map (kbd "f") 'treemacs-change-root)
(define-key treemacs-mode-map (kbd "h") 'treemacs-toggle-show-dotfiles)

(global-set-key [f7] 'treemacs-toggle)
(global-set-key [f8] 'treemacs-projectile)
(global-set-key [f9] 'treemacs-find-file)
