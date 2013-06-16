;; node REPL
(require 'js-comint)
(require 'js2-mode)
(setq inferior-js-program-command "env NODE_NO_READLINE=1 node")

(setq js2-mode-hook (lambda ()
                          (setq indent-tabs-mode nil)
                          (setq js2-basic-offset 2)))

(provide 'setup-js)
