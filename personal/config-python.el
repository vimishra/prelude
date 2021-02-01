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
(setq
 conda-env-home-directory (expand-file-name "~/anaconda3/") ;; as in previous example; not required
 conda-env-subdirectory "envs")
