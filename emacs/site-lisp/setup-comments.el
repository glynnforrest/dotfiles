(use-package evil-nerd-commenter
  :defer t
  :commands (evilnc-comment-operator)
  :init
  (general-define-key
   :states '(normal visual)
   "gc" 'evilnc-comment-operator))

(provide 'setup-comments)
