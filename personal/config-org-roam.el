;; Custom org-mode ELPA repo
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Set org-directory
(setq org-directory "~/Documents/OrgNotes")


;; Root Directory for Org Roam
(setq org-roam-directory "~/Documents/OrgNotes/OrgRoam")
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

;; I want to see the whole note when opened
(setq org-startup-folded nil)


;; Make Ctrl-a/Ctrl-e do what I want in org mode
(setq org-special-ctrl-a/e t)
;; I don't want ctrl-k to kill my whole tree
(setq org-ctrl-k-protect-subtree t)

;; Deft configuration
(require 'deft)
(setq deft-directory "~/Documents/OrgNotes/OrgRoam/")
(setq deft-extensions '("org"))
(setq deft-default-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-recursive t)
(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)
(setq deft-auto-save-interval 0)
(setq deft-file-naming-rules '((nospace . "-")))

;; Setup org-roam mode
(add-hook 'after-initial-hook 'org-roam-mode)



;; Setup org dailies
(require 'org-roam-dailies)
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n\n")))

;; Org Latex
(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))



;; Org rifle
(require 'helm-org-rifle)
(setq helm-org-rifle-directories-recursive t)
;; My keymaps
(define-key vm-map (kbd "s") 'org-download-screenshot)
(define-key vm-map (kbd "d") 'deft)
(define-key vm-map (kbd "r") 'helm-org-rifle-org-directory)
(define-key vm-map (kbd "l") 'org-roam)
(define-key vm-map (kbd "f") 'org-roam-find-file)
(define-key vm-map (kbd "i") 'org-roam-insert)
(define-key vm-map (kbd "n") 'org-roam-dailies-find-today)
(define-key vm-map (kbd "c") 'org-capture)


;; Other orgmode beautification
(setq org-hide-emphasis-markers t)

;; Org bullets
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Org Superstar - replacement for bullets.
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; Org Screenshot Setting up
(setq org-download-screenshot-method "~/tools/bin/screenshot.sh %s")
(setq-default org-download-image-dir "~/Documents/OrgNotes/images")

;; Winner - Browsing history
(winner-mode +1)
(define-key winner-mode-map (kbd "<M-Shift-left>") #'winner-undo)
(define-key winner-mode-map (kbd "<M-Shift-right>") #'winner-redo)

;; Default Inbox file for TODOs
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/OrgNotes/Inbox.org")
               "* TODO %?\n%a\n"))))

;; Org Todo Keywords
(setq org-todo-keywords
  '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "INTR(i)" "DONE(d)")))
;; Show the daily agenda by default.
(setq org-agenda-span 'day)

;; Hide tasks that are scheduled in the future.
(setq org-agenda-todo-ignore-scheduled 'future)

;; Use "second" instead of "day" for time comparison.
;; It hides tasks with a scheduled time like "<2020-11-15 Sun 11:30>"
(setq  org-agenda-todo-ignore-time-comparison-use-seconds t)

;; Hide the deadline prewarning prior to scheduled date.
(setq org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)

;; Customized view for the daily workflow. (Command: "C-c a n")
(setq org-agenda-custom-commands
  '(("n" "Agenda / INTR / PROG / NEXT"
     ((agenda "" nil)
      (todo "INTR" nil)
      (todo "PROG" nil)
      (todo "NEXT" nil))
     nil)))


;; Set command to open the Inbox file
(set-register ?i (cons 'file "~/Documents/OrgNotes/Inbox.org"))

