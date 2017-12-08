;; Helm

(my/ensure-package-installed 'helm)

(require 'helm)
(helm-mode)

(setq helm-M-x-reverse-history nil)
(setq helm-display-header-line nil)
(setq helm-buffer-details-flag nil)

(setq helm-mini-default-sources '(helm-source-buffers-list
                                  helm-source-projectile-files-list
                                  helm-source-recentf
                                  helm-source-buffer-not-found))

(let ((map my/global-map))
  (define-key map (kbd "C-;") 'helm-M-x)
  (define-key map (kbd "C-x C-f") 'helm-find-files)
  (define-key map (kbd "C-t") 'helm-mini)
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

(defun my/kill-helm-buffers ()
  "Kills all the helm buffers."
  (interactive)
  (let ((helm-buffers (seq-filter
                       (lambda (buffer) (string-match "^\\*helm.*\\*$" (buffer-name buffer)))
                       (buffer-list))))
    (seq-do 'kill-buffer helm-buffers)))
