;; * Yoshi theme

(my/ensure-package-installed 'yoshi-theme)

(load-theme 'yoshi t)

;; ** Post-customization

(custom-theme-set-faces
 `yoshi
 `(cursor                            ((t (:foreground nil       :background "#eead0e"))))
 `(isearch                           ((t (:foreground "#dd3333" :background "#222222" :underline t))))
 `(lazy-highlight                    ((t (:foreground "#dd3333" :background nil :underline t))))
 `(diff-added                        ((t (:foreground "#55bb55" :background nil))))
 `(magit-diff-added                  ((t (:foreground "#55bb55" :background nil))))
 `(magit-diff-added-highlight        ((t (:foreground "#55bb55" :background nil))))
 `(diff-added                        ((t (:foreground "#bb5555" :background nil))))
 `(magit-diff-removed                ((t (:foreground "#bb5555" :background nil))))
 `(magit-diff-removed-highlight      ((t (:foreground "#bb5555" :background nil))))
 `(diff-refine-added                 ((t (:foreground "#00ff00" :background nil))))
 `(diff-refine-removed               ((t (:foreground "#ff0000" :background nil))))
 `(magit-diff-hunk-heading           ((t (:foreground "#5555bb" :background nil))))
 `(magit-diff-hunk-heading-selection ((t (:foreground nil       :background nil))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground nil       :background nil))))
 `(magit-diff-context-highlight      ((t (:foreground nil       :background nil))))
 `(magit-section-highlight           ((t (:foreground nil       :background nil)))))
