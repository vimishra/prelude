;; I hate whitespace mode
(setq prelude-whitespace nil)

;; Swap the keys in helm - use tab completion for completing.
(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
(define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") #'helm-select-action)

;; Helm Fuzzy Search
(setq completion-styles `(basic partial-completion emacs22 initials
                                ,(if (version<= emacs-version "27.0") 'helm-flex 'flex)))

;; Fuzzy Match in helm
(setq helm-recentf-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-M-x-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)

;; Enable Speedbar
(require 'sr-speedbar)

;; Switch window
;; Visual buffer switch
(global-set-key (kbd "C-x o") 'switch-window)

;; Make a script automatically executable
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Smart Modeline
(setq sml/theme 'dark)
(sml/setup)


;; Helm-ag
;; For Counsel/ivy
;; (global-set-key (kbd "C-x C-m") 'counsel-M-x)
;; (global-set-key (kbd "C-c x") 'counsel-ag)
;; (setq ivy-count-format "[%d/%d] ")
                                        ; (global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-c x") 'helm-ag)
(require 'swiper)
(require 'swiper-helm)
(global-set-key (kbd "C-s") 'swiper-helm)

;; Colorful dired
(add-hook 'dired-mode-hook 'diredfl-mode)

;; Neotree
(require 'neotree)
(global-set-key (kbd "C-c C-t") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; PDF Tools
(pdf-loader-install)

;; I don't want to see line numbers
(global-nlinum-mode -1)
