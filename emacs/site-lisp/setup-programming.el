(require 'autopair)
(setq autopair-blink nil)
(autopair-global-mode t)

;; (require 'smartparens)
;; (smartparens-mode t)

(require 'git-gutter)
(global-git-gutter-mode)

(require 'emamux)
(setq emamux:use-nearest-pane t)

;; Overriding this function so Emacs.app on OSX works.
(defun emamux:in-tmux-p () t)

;;; Bound to ,T
(require 'try-code)

(require 'paredit-everywhere)
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)

(require 'setup-eshell)
(require 'setup-flycheck)
(require 'magit)
(require 'git-commit-mode)

(provide 'setup-programming)
