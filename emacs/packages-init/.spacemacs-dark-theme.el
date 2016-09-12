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
 `(cursor                            ((t (:foreground nil       :background "#ff1493"))))
 `(isearch                           ((t (:foreground "#cc3333" :background nil))))
 `(lazy-highlight                    ((t (:foreground "#33cc33" :background nil))))
 `(diff-added                        ((t (:foreground "#55bb55" :background nil))))
 `(magit-diff-added                  ((t (:foreground "#55bb55" :background nil))))
 `(magit-diff-added-highlight        ((t (:foreground "#55bb55" :background nil))))
 `(diff-added                        ((t (:foreground "#bb5555" :background nil))))
 `(magit-diff-removed                ((t (:foreground "#bb5555" :background nil))))
 `(magit-diff-removed-highlight      ((t (:foreground "#bb5555" :background nil))))
 `(diff-refine-added                 ((t (:foreground "#00ff00" :background nil))))
 `(diff-refine-removed               ((t (:foreground "#ff0000" :background nil))))
 `(magit-diff-hunk-heading           ((t (:foreground nil       :background nil))))
 `(magit-diff-hunk-heading-selection ((t (:foreground nil       :background nil))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground nil       :background nil))))
 `(magit-diff-context-highlight      ((t (:foreground nil       :background nil))))
 `(magit-section-highlight           ((t (:foreground nil       :background nil)))))

;; ** Mode line

(my/load-file-relative ".powerline-top-theme.el")
(my/powerline-top-theme)
