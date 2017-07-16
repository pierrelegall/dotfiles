;; diminish

(my/ensure-package-installed 'diminish)

(require 'diminish)

;; A better solution should exists
(defun my/diminish-modes (modes)
  "Diminish multiple modes."
  (seq-map (lambda (mode)
             (diminish (car mode)))
           modes)
  (diminish-undo 'projectile-mode))
