(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(require 'use-package)

;; Tell straight to install the package for each use-package declaration
(eval-when-compile (require 'straight))
(setq straight-use-package-by-default t)

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))

(require 'tramp)
(require 'setup-core)
(require 'setup-keys)

;; Major modes
(require 'setup-ai)
(require 'setup-apache)
(require 'setup-coffeescript)
(require 'setup-css)
(require 'setup-hashicorp)
(require 'setup-dired)
(require 'setup-docker)
(require 'setup-edit-server)
(require 'setup-elisp)
(require 'setup-git)
(require 'setup-go)
(require 'setup-groovy)
(require 'setup-help)
(require 'setup-js)
(require 'setup-jsonnet)
(require 'setup-kubernetes)
(require 'setup-lua)
(require 'setup-markdown)
(require 'setup-nix)
(require 'setup-org)
(require 'setup-php)
(require 'setup-protobuf)
(require 'setup-pug)
(require 'setup-python)
(require 'setup-saltstack)
(require 'setup-shell-script)
(require 'setup-sql)
(require 'setup-typescript)
(require 'setup-tmux)
(require 'setup-web-mode)
(require 'setup-yaml)
(require 'setup-zig)

;; Personal config if available, like usernames and passwords
(require 'setup-personal nil t)

;; Load custom settings
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Quarantine - old files that need updating
;; (require 'defuns)
;; (require 'mappings)
;; (require 'appearance)
;; (require 'setup-erc)
;; (require 'setup-eshell)
;; (require 'setup-lilypond)
;; (require 'setup-multiple-cursors)

;; Quarantined packages
;; dired+
;; epl
;; impatient-mode
;; php-eldoc
