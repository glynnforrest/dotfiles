;; use spaces by default
(setq-default
 c-basic-offset 4
 tab-width 4
 )

;; (require 'autopair)
;; (setq autopair-blink nil)
;; (autopair-global-mode t)

(require 'smartparens)
(smartparens-mode t)

(require 'git-gutter)
(global-git-gutter-mode)

;;; Bound to ,T
(require 'try-code)

;; toggle comments
(define-key evil-visual-state-map ",c"
  (lambda()
    (interactive)
    (comment-or-uncomment-region (region-beginning) (region-end))
    (evil-visual-restore)))

(require 'setup-magit)
(require 'setup-js)
(require 'setup-css)
(require 'setup-eshell)
(require 'test-case-mode)

(provide 'setup-programming)
