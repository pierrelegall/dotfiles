;; * Face

;; ** Bars

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ** Cursor

(blink-cursor-mode t)
(setq blink-cursor-interval .05)
(setq blink-cursor-blinks 3)

;; Indicators

(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries nil)

;; ** Mode line

(setq line-number-mode 1)
(setq column-number-mode 1)

;; ** Theme

(load-theme 'abyss t)

;; ** Font

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-14"))
