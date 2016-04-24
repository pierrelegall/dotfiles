;; * Face

;; ** Bars

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ** Cursor

(blink-cursor-mode t)
(setq blink-cursor-interval .1)
(setq blink-cursor-blinks 2)

;; ** Font

(set-default-font "Inconsolata 12")

;; ** Theme

(load-theme 'solarized-dark t)
