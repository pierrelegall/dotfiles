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
