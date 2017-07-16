;; * Face

;; ** Line wrap

(setq-default truncate-lines t)

;; ** Bars

(menu-bar-mode -1)
(tool-bar-mode -1)

(set-scroll-bar-mode 'left)
(scroll-bar-mode -1)
(setq scroll-bar-adjust-thumb-portion nil)

;; ** Cursor

(blink-cursor-mode t)
(setq blink-cursor-interval 0.5)
(setq blink-cursor-blinks 0)

;; ** Fringe

(setq-default indicate-empty-lines t)

;; ** Mode line

(setq line-number-mode 1)
(setq column-number-mode 1)

;; ** Theme

(my/load-file-relative ".spacemacs-dark-theme.el")

;; ** Font

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-13"))

;; ** Frame

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 140))
