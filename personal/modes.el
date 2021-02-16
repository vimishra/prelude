;; I hate whitespace mode
(setq prelude-whitespace nil)

;; I don't like flyspell
(setq prelude-flyspell nil)

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

;; Enable yasnippet
(use-package yasnippet
             :ensure t
             :init
             (yas-global-mode 1)
             :config
             (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))


;; Realgud mode
(require 'realgud)

;; Customization for ivy
(setq ivy-count-formt "(%d/%d) ")
(ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
(global-set-key (kbd "C-x C-m") 'counsel-M-x)
(global-set-key (kbd "C-c x") 'counsel-ag)

;; Enable ivy-prescient
(require 'ivy-prescient)
(ivy-prescient-mode)

;; Enable counsel-dash
(require 'counsel-dash)
(add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 3"))))

