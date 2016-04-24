;; * Minibuffer

;; ** Completion

(setq read-file-name-completion-ignore-case t)

;; ** Map

(let ((map minibuffer-local-map))
  (define-key map (kbd "C-p") 'previous-history-element)
  (define-key map (kbd "C-n") 'next-history-element))

;; ** Hooks

(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))
