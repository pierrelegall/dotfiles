;; * Auto completely

(require 'auto-complete)

(add-hook 'prog-mode-hook 'auto-complete-mode)

(setq ac-use-fuzzy t)

(setq ac-use-menu-map t)

(define-key ac-completing-map (kbd "RET") nil)
(define-key ac-menu-map (kbd "RET") nil)
(define-key ac-menu-map (kbd "C-S-i") 'ac-fuzzy-complete)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
