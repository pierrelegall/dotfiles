;; * Eshell

;; ** Title

(setq eshell-banner-message ";; Welcome to the Emacs shell\n")

;; ** Completion

(setq eshell-cmpl-ignore-case t)

;; ** Prompt

(setq eshell-prompt-function
  (lambda ()
    (concat
     (propertize "\n")
     (propertize "[" 'face `(:foreground "dodger blue" :weight bold))
     (propertize (user-login-name) 'face `(:foreground "#d23681" :weight bold))
     (propertize "@" 'face `(:foreground "dodger blue" :weight bold))
     (propertize (system-name) 'face `(:foreground "#d23681" :weight bold))
     (propertize " ")
     (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground "#2aa097" :weight bold))
     (propertize "]" 'face `(:foreground "dodger blue" :weight bold))
     (propertize "\n")
     (if (= (user-uid) 0)
         (propertize "#" 'face `(:foreground "orange red"))
       (propertize "$" 'face `(:foreground "medium sea green" :weight bold)))
     (propertize " "))))

(setq eshell-prompt-regexp "^[#$] ")

;; ** Command

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun pcomplete/sudo ()
  "Make the sudo command completion compatible."
  (let ((prec (pcomplete-arg 'last -1)))
    (cond ((string= "sudo" prec)
           (while (pcomplete-here*
                   (funcall pcomplete-command-completion-function)
                   (pcomplete-arg 'last) t))))))

(defun eshell/top ()
  "Use helm-top instead of top with eshell."
  (helm-top))

;; ** Maps

(let ((map my/global-map))
  (define-key map (kbd "C-:") 'eshell-command))

;; ** Hooks

(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)))
