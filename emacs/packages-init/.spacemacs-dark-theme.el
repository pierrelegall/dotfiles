;; * Spacemacs theme

;; ** Pre-customization

(setq spacemacs-theme-org-height nil)
(setq spacemacs-theme-comment-bg nil)

;; ** Spacemacs theme hack forcing GUI colors in daemon mode

(require 'spacemacs-common)
(defun true-color-p () t)

;; ** Loading

(load-theme 'spacemacs-dark t)

;; ** Post-customization

(custom-theme-set-faces
 `spacemacs-dark
 `(cursor         ((t (:foreground nil       :background "#dd2222"))))
 `(lazy-highlight ((t (:foreground "#33cc33" :background nil))))
 `(isearch        ((t (:foreground "#cc3333" :background nil)))))
