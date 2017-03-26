;; emojify

(my/ensure-package-installed 'emojify)

(setq emojify-display-style 'image)
(setq emojify-emoji-styles '(github))

(let ((map my/global-map))
  (define-key map (kbd "C-S-j") 'emojify-insert-emoji))

(global-emojify-mode)
