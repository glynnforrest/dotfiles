(use-package magit :ensure t
  :commands magit-status
  :config
  (setq magit-log-arguments '("-n256" "--decorate"))
  (setq inhibit-magit-revert t)
  (add-hook 'with-editor-mode-hook 'evil-insert-state)

  (general-define-key
   :states '(normal)
   :keymaps 'magit-blame-mode-map
   "b" 'magit-blame
   "j" 'magit-blame-next-chunk
   "k" 'magit-blame-previous-chunk
   "y" 'magit-blame-copy-hash))

(use-package evil-magit :ensure t
  :after magit)

(use-package git-gutter :ensure t
  :diminish ""
  :config
  (global-git-gutter-mode t))

(use-package git-timemachine :ensure t
  :config
  (defhydra hydra-git-timemachine ()
    "Git timemachine"
    ("n" git-timemachine-show-next-revision "Next commit")
    ("p" git-timemachine-show-previous-revision "Previous commit")
    ("q" git-timemachine-quit "Quit"))

  (defun gf/git-timemachine ()
    "Start git-timemachine with a hydra."
    (interactive)
    (git-timemachine)
    (hydra-git-timemachine/body)))

(provide 'setup-git)
