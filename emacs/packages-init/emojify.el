;; emojify

(my/ensure-package-installed 'emojify)

(setq emojify-display-style 'image)
(setq emojify-emoji-styles '(github))

(global-emojify-mode)
