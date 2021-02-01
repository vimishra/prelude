; Root Directory for Org Roam
(setq org-roam-directory "~/Documents/OrgRoam/")
(setq org-roam-graph-viewer "/usr/bin/open")

;; Org Mode Setup
;; Org Mode Setup
;; Configuring for org-download
(require 'org-download)

;; Org mode hooks
(add-hook 'org-mode-hook
          (lambda ()
            ;; Turn off line numbering, it makes org so slow
            (linum-mode -1)
            ;; Set fill column to 100
            (setq fill-column 100)
            ;; Enable automatic line wrapping at fill column
            (auto-fill-mode t)))

;; Org Autocomplete
(require 'org-ac)
;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "org-ac")
(org-ac/config-default)
;; Set org-directory
(setq org-directory "~/Documents/OrgNotes")
;; I want to see the whole note when opened
(setq org-startup-folded nil)

;; Org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Appearance updates
(setq org-odd-levels-only t)
;; Make Ctrl-a/Ctrl-e do what I want in org mode
(setq org-special-ctrl-a/e t)
;; I don't want ctrl-k to kill my whole tree
(setq org-ctrl-k-protect-subtree t)

;; Deft configuration
(require 'deft)
(setq deft-directory "~/Documents/OrgNotes")
(setq deft-extensions '("org"))
(setq deft-default-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)
(setq deft-auto-save-interval 0)
(setq deft-file-naming-rules '((nospace . "-")))

;; Helm org rifle
(require 'helm-org-rifle)
(define-key vm-map (kbd "r") 'helm-org-rifle-org-directory)
(define-key vm-map (kbd "s") 'org-download-screenshot)

;; Setup org-roam mode
(add-hook 'after-initial-hook 'org-roam-mode)

;; Setup org dailies
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n\n")))
