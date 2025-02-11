(eval-when-compile (require 'use-package))

(use-package gptel
  :config
  (setq gptel-api-key (auth-source-pick-first-password :host "api.openai.com"))
  (gptel-make-gemini "Gemini" :key (auth-source-pick-first-password :host "aistudio.google.com") :stream t))

(provide 'setup-ai)
