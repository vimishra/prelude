;; (prelude-require-packages '(ag smart-mode-line switch-window bm auto-complete org-download org-ac org-bullets deft helm-org-rifle elpy elpygen insert-shebang helm-swoop color-theme-sanityinc-tomorrow flx flx-isearch helm-flx neotree py-autopep8 conda swiper swiper-helm all-the-icons all-the-icons-dired  ))


;; set up my own map - now I can define keys with C-1 and then
;; define any sequence of chars after that. See the commented example below
(define-prefix-command 'vm-map)
(global-set-key (kbd "C-1") 'vm-map)

(prelude-require-packages '(ag smart-mode-line switch-window org-download org-ac org-bullets deft helm-org-rifle elpy elpygen color-theme-sanityinc-tomorrow conda lsp-python-ms org-roam sr-speedbar switch-window swiper swiper-helm diredfl treemacs lsp-treemacs pdf-tools use-package ivy-rich realgud deadgrep counsel-projectile blacken))
