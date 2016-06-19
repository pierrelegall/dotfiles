;; * Ruby mode

(add-hook 'ruby-mode-hook 'robe-mode)

(set 'ruby-insert-encoding-magic-comment nil)

;; ** Robe

(add-hook 'robe-mode-hook 'ac-robe-setup)
