;; * Spacemacs theme

(my/ensure-package-installed 'spacemacs-theme)

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
 `(cursor
   ((t (:background "#eead0e"))))
 `(font-lock-comment-face
   ((t (:foreground "#ffdf7f" :slant italic))))
 `(font-lock-comment-delimiter-face
   ((t (:inherit nil))))
 `(show-paren-match
   ((t (:foreground "DeepPink" :inverse-video nil :weight bold))))
 `(magit-diff-added
   ((t (:foreground "#2ea943" :background nil))))
 `(magit-diff-removed
   ((t (:foreground "#cd2727" :background nil))))
 `(diff-refine-added
   ((t (:background "#28372e"))))
 `(diff-refine-removed
   ((t (:background "#382b2e"))))
 `(linum
   ((t (:background "#212026" :slant italic :weight normal :underline nil :inherit fringe)))))

;; ** Mode line

(my/load-file-relative ".spaceline.el")
