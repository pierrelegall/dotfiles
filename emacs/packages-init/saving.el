;; * Saving

(setq auto-save-default nil)
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs-backups")))

(add-hook 'write-file-hooks
          'delete-trailing-whitespace)
