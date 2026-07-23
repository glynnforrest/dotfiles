(eval-when-compile (require 'use-package))

(use-package transient)

(use-package magit
  :commands magit-status
  :after transient
  :config
  (setq
   magit-log-arguments '("-n32" "--decorate")
   magit-process-connection-type nil
   magit-refresh-verbose t
   magit-log-margin '(t "%H:%M %a %d %b %Y" magit-log-margin-width t 18))
  (add-hook 'with-editor-mode-hook 'evil-insert-state)

  (general-define-key
   :keymaps '(magit-mode-map magit-diff-mode-map)
   "SPC" 'nil))

  ;; (general-define-key
  ;;  :states '(normal)
  ;;  :keymaps 'magit-blame-mode-map
  ;;  "b" 'magit-blame
  ;;  "j" 'magit-blame-next-chunk
  ;;  "k" 'magit-blame-previous-chunk
  ;;  "y" 'magit-blame-copy-hash))

(use-package git-link
  :after magit
  :config

  (setq git-link-open-in-browser t)

  (general-define-key
   :states '(normal visual insert emacs)
   :prefix gf/leader-key
   :non-normal-prefix gf/non-normal-leader-key
   "go" 'git-link))

(use-package diff-hl
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh))

(use-package git-timemachine
  :config
  (defhydra hydra-git-timemachine ()
    "Git timemachine"
    ("n" git-timemachine-show-next-revision "Next commit")
    ("p" git-timemachine-show-previous-revision "Previous commit")
    ("q" git-timemachine-quit "Quit" :exit t))

  (defun gf/git-timemachine ()
    "Start git-timemachine with a hydra."
    (interactive)
    (git-timemachine)
    (hydra-git-timemachine/body)))

(provide 'setup-git)
