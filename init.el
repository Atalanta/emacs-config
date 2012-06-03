;; Add local lisp directory to load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Make elpa code available
(let ((default-directory "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Use marmalade package repository
(require 'package)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Set up a pleasing color theme (NB this is Emacs 24-specific)
(require 'solarized-theme)
(deftheme solarized-dark "The dark variant of the Solarized colour theme")
(create-solarized-theme 'dark)
(provide-theme 'solarized-dark)
(load-theme 'solarized-dark t)

;; Make homebrew packages available
(push "/usr/local/bin" exec-path)
(setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))

;; We don't want a billion backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Tabs should be 2 spaces only
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; We don't need no stinking startup message
(setq inhibit-startup-message t)

;; Save time by allowing single character 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Allow replacement or deletion of a region in the 'traditional' way
(delete-selection-mode t)

;; Get rid of menu, tool and scroll bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; General UI settings
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(define-key global-map (kbd "s-=") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)
                                   
;; On a mac, allow the '#' key to be pressed
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Start ido mode by default
(require 'ido) 
(ido-mode t)

;; ;; TODO: Install magit
;; ;;(require 'magit)

;; ;; TODO: I think this might need to be updated, as there's a bug
;; ;; wrap-region
;; (require 'wrap-region)
;; ;;(wrap-region-global-mode t)
;; ;;(wrap-region-add-wrapper "`" "`")

;; ;; org-mode
;; ;;
;; ;; Ensure all files that end in .org are treated as org-mode files
;; ;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Set up global key bindings 
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c l") 'org-store-link)


(setq org-agenda-files (quote ("~/Dropbox/GTD/gtd.org")))

;; Templates for org capture mode
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/GTD/gtd.org" "Inbox")
         "* %?\n")
        ("n" "Next Action" entry (file+headline "~/Dropbox/GTD/gtd.org" "Next Actions")
         "* %?\n\n:PROPERTIES:\n:PROJECT: %a\n:END:\n")
        ("s" "Someday Maybe" entry (file+headline "~/Dropbox/GTD/gtd.org" "Someday Maybe")
         "* %?\n")
        ("b" "Bookmark" entry (file "~/org/bookmarks.org")
         "* %?\nURL: \n" )
        ("p" "Project" entry (file+headline "~/Dropbox/GTD/gtd.org" "Projects")
         "* %?\n** Outcome\n-\n")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n")))

 ;; Set up mobile org 
 (setq org-mobile-directory "~/Dropbox/MobileOrg")
 (setq org-mobile-inbox-for-pull "~/org/from-mobile.org")
;; (setq org-mobile-use-encryption t)
;; (setq org-mobile-encryption-password "something")

;; ;; Spare trees
;; (setq org-agenda-custom-commands
;; '(("l" occur-tree "look")))


;; Tags 
(setq org-tag-alist '(("@WORK" . ?w)
                      ("@HOME" . ?h)
                      ("@COMPUTER" . ?c)
                      ("@ERRANDS" . ?e)
                      ("@HELENA" . ?H)
                      ("@FOLLOW UP" . ?f)))

;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))

;; Integrate with diary mode
(setq org-agenda-include-diary t)


;; Refile settings
;; Exclude DONE state tasks from refile targets
;; (defun bh/verify-refile-target ()
;; "Exclude todo keywords with a done state from refile targets"
;; (not (member (nth 2 (org-heading-components)) org-done-keywords)))
;; (setq org-refile-target-verify-function 'bh/verify-refile-target)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes (quote ("54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" default))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
