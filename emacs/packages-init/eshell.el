;; * Eshell

(my/ensure-package-installed 'shell-switcher)
(my/ensure-package-installed 'eshell-fringe-status)

(setq eshell-banner-message ";; Welcome to the Emacs shell\n")
(setq eshell-cmpl-ignore-case t)
(setq eshell-prompt-regexp "^[#$] ")
(setq eshell-prompt-function 'my/eshell-prompt-function)

(require 'vc-git)

(defun my/eshell-prompt-function ()
  (concat
   (propertize "\n")
   (propertize "[" 'face `(:foreground "dodger blue" :weight bold))
   (propertize (user-login-name) 'face `(:foreground "#d23681" :weight bold))
   (propertize "@" 'face `(:foreground "dodger blue" :weight bold))
   (propertize (system-name) 'face `(:foreground "#d23681" :weight bold))
   (propertize " ")
   (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground "#2aa097" :weight bold))
   (when (vc-git-root (eshell/pwd))
     (concat
      (propertize " ")
      (propertize (format "(%s)" (car (vc-git-branches))) 'face `(:foreground "#ffff55" :weight bold))))
   (propertize "]" 'face `(:foreground "dodger blue" :weight bold))
   (propertize "\n")
   (if (= (user-uid) 0)
       (propertize "#" 'face `(:foreground "orange red"))
     (propertize "$" 'face `(:foreground "medium sea green" :weight bold)))
   (propertize " ")))

;; ** Commands

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/top ()
  "Use helm-top instead of top with eshell."
  (helm-top))

(defun pcomplete/sudo ()
  "Make the sudo command completion compatible."
  (let ((prec (pcomplete-arg 'last -1)))
    (cond ((string= "sudo" prec)
           (while (pcomplete-here*
                   (funcall pcomplete-command-completion-function)
                   (pcomplete-arg 'last) t))))))

(let ((map my/global-map))
  (define-key map (kbd "C-x t") 'shell-switcher-switch-buffer)
  (define-key map (kbd "C-x T") 'shell-switcher-new-shell))

(let ((map my/global-map))
  (define-key map (kbd "C-:") 'eshell-command))

(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)))

(add-hook 'eshell-mode-hook
          'eshell-fringe-status-mode)
