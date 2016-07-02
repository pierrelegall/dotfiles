;; * Grandshell theme

(let ((class '((class color) (min-colors 89)))
      (background "black")
      (alt-background "#222")
      (strong "#eee")
      (bright "#eee")
      (normal "gray")
      (faint "#888")
      (dark "#888")
      (faintest "#333")
      (very-dark "#333")
      (darkest "black")
      (contrast-background "#402240")
      (red-brightest "#ffbbbb")
      (red-bright "#f25a5a")
      (red "red")
      (red-dark "#5a0000")
      (red-darkest "#1a0000")
      (pink-brightest "#ffbfd7")
      (pink-brighter "#ff8fb7")
      (pink "#ff5f87")
      (pink-darker "#aa2255")
      (orange "#efc334")
      (yellow "#f6df92")
      (yellow-darker "#a86")
      (yellow-dark "#643")
      (green-bright "#dcf692")
      (green "#acfb5a")
      (green-darker "#77bb33")
      (cyan "#5af2ee")
      (turquoise "#3affa3")
      (malachite "#3aff83")
      (blue-bright "#dcdff2")
      (blue "#b2baf6")
      (blue-darker "#5555dd")
      (magenta-bright "#f09fff")
      (magenta "#c350ff")
      (magenta-dark "#34004A")
      (magenta-darkest "#1B0026")
      (violet "#78537A")
      (violet-darkest "#200020")
      (violet-red "#d020a7"))

  (custom-theme-set-faces
   'grandshell

   ;; ** Mode line

   `(mode-line ((t (:foreground ,strong :background ,contrast-background))))
   `(mode-line-inactive ((t (:foreground ,yellow-dark :background ,violet-darkest :weight light :box nil :inherit (mode-line )))))
   `(mode-line-buffer-id ((t (:foreground ,orange))))

   ;; ** Show parent

   `(show-paren-match ((,class (:foreground "#ff0095" :background nil :weight bold))))

   ;; ** Diff

   `(diff-refine-removed ((,class (:inherit magit-diff-removed-highlight :foreground "#ff0000"))))
   `(diff-refine-added ((,class (:inherit magit-diff-added-highlight :foreground "#00ff00"))))


   ;; ** Diff hl

   `(diff-hl-insert ((t (:foreground ,green :background nil))))
   `(diff-hl-change ((t (:foreground ,blue :background nil))))
   `(diff-hl-delete ((t (:foreground ,red :background nil :weight bold))))

   ;; ** Magit

   `(magit-diff-added ((,class (:foreground "#88ff88"))))
   `(magit-diff-added-highlight ((,class (:foreground "#88ff88" :weight bold))))
   `(magit-diff-removed ((,class (:foreground "#ff7777"))))
   `(magit-diff-removed-highlight ((,class (:foreground "#ff7777" :weight bold))))))
