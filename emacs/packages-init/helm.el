;; * Helm

(require 'helm)
(helm-mode)

;; ** Maps

(let ((map my/global-map))
  (define-key map (kbd "C-;") 'helm-M-x)
  (define-key map (kbd "C-x C-f") 'helm-find-files)
  (define-key map (kbd "C-x b") 'helm-mini)
  (define-key map (kbd "C-x a") 'helm-apropos))

(let ((map helm-map))
  (define-key map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key map (kbd "C-h") (kbd "<backspace>"))
  (define-key map (kbd "C-S-h") (kbd "C-<backspace>"))
  (define-key map (kbd "C-v") 'helm-next-page)
  (define-key map (kbd "C-S-v") 'helm-previous-page))

(let ((map helm-find-files-map))
  (define-key map (kbd "C-h") 'helm-ff-delete-char-backward)
  (define-key map (kbd "C-S-h") 'backward-kill-word))
