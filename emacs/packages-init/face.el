;; * Face

;; ** Line wrap

(setq truncate-partial-width-windows t)

;; ** Bars

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ** Cursor

(blink-cursor-mode t)
(setq blink-cursor-interval .05)
(setq blink-cursor-blinks 3)

;; ** Fringe

(setq-default indicate-empty-lines t)

;; ** Mode line

(setq line-number-mode 1)
(setq column-number-mode 1)

;; ** Theme

(load-theme 'spacemacs-dark t)
(load-file (concat
            (file-name-directory (or load-file-name buffer-file-name))
            ".spacemacs-dark-theme.el"))

;; ** Font

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-14"))
