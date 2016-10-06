;; * Emacs configuration entry point

;; ** Package initialization

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(defvar my/package-last-refresh-contents
  nil
  "Last date of the package list refresh.")

(defun my/ensure-package-installed (package-name)
  "Install the package named PACKAGE-NAME if not already installed."
  (unless (package-installed-p package-name)
    (unless my/package-last-refresh-contents
      (package-refresh-contents)
      (setq my/package-last-refresh-contents (current-time)))
    (package-install package-name)))

;; ** Config root

(defvar my/config-root
  (cond ((or (eq system-type 'ms-dos) (eq system-type 'windows-nt)) "_config/emacs")
        (t ".config/emacs"))
  "Root of the Emacs configuration files.")

;; ** My functions initialization

(defvar my/functions-file
  (concat my/config-root "/my-functions.el")
  "My functions file.")

(defun my/load-functions ()
  "Load my functions file."
  (load-file my/functions-file))

(my/load-functions)

;; ** My global map initialization

(defvar my/global-map-file
  (concat my/config-root "/my-global-map.el")
  "My global map file.")

(defun my/load-global-map ()
  "Load my global map file."
  (load-file my/global-map-file))

(my/load-global-map)

;; ** Init files loading

(defvar my/packages-init-files-directory
  (concat my/config-root "/packages-init")
  "Directory of the initialization files.")

(defvar my/packages-init-files
  (directory-files my/packages-init-files-directory t "^[^.]")
  "List of the initialization files.")

(defun my/load-packages-init-files ()
  "Load all the initialization files."
  (mapcar (lambda (package-init-file)
            (load-file package-init-file))
          my/packages-init-files))

(my/load-packages-init-files)
