;; * Emacs configuration entry point

(defvar my/init-files-directory
  "~/.config/emacs/init-files"
  "Directory of the initialization files.")

(defvar my/init-files
  (directory-files my/init-files-directory t "^[^.]")
  "List of the initialization files.")

(defun my/load-init-files ()
  "Load all the initialization files."
  (mapcar (lambda (init-file)
            (load-file init-file))
          my/init-files))

(defvar my/functions-file
  "~/.config/emacs/functions.el"
  "My functions file.")

(defun my/load-functions ()
  "Load my functions file."
  (load-file my/functions-file))

(package-initialize)
(my/load-functions)
(my/load-init-files)

;;;; Packages

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


(put 'dired-find-alternate-file 'disabled nil)

