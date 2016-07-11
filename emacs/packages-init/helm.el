;; * Helm

(require 'helm)
(helm-mode t)

;; ** Key bindings

(let ((map my/global-map))
  (define-key map (kbd "C-;") 'helm-M-x)
  (define-key map (kbd "C-x C-f") 'helm-find-files)
  (define-key map (kbd "C-x b") 'helm-mini)
  (define-key map (kbd "C-x a") 'helm-apropos))

(let ((map helm-map))
  (define-key map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key map (kbd "C-h") (kbd "<backspace>"))
  (define-key map (kbd "C-S-h") (kbd "C-<backspace>"))
  (define-key map (kbd "C-v") 'helm-next-page)
  (define-key map (kbd "C-S-v") 'helm-previous-page))
