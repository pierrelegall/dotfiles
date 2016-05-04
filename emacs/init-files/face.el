;; * Face

;; ** Bars

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ** Cursor

(blink-cursor-mode t)
(setq blink-cursor-interval .1)
(setq blink-cursor-blinks 2)

;; ** Mode line

(setq line-number-mode 1)
(setq column-number-mode 1)

;; ** Theme

(load-theme 'solarized-dark t)

;; ** Font

(custom-set-faces
 '(default ((t (:inherit nil :height 120 :family "Inconsolata")))))
