;; Setup Python IDE
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook #'lsp) ; or lsp-deferred

;; Anaconda Mode
(require 'conda)
;; if you want interactive shell support, include:
(conda-env-initialize-interactive-shells)
;; if you want eshell support, include:
(conda-env-initialize-eshell)
;; if you want auto-activation (see below for details), include:
(conda-env-autoactivate-mode t)
(setq conda-anaconda-home "/Users/vikasmis/anaconda3/")
(setq
 conda-env-home-directory (expand-file-name "~/anaconda3/envs") ;; as in previous example; not required
 conda-env-subdirectory "")

;; Setup blacken
(use-package blacken
  :delight
  :hook (python-mode . blacken-mode)
  :custom (blacken-line-length 79))


;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")
