(setq user-full-name "Isaac S"
      user-mail-address "isaac@isaac.ac")

(setq doom-font (font-spec :family "SF Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Helvetica" :size 14))

(setq doom-theme 'doom-one)
(setq display-line-numbers-type nil)
(setq which-key-idle-delay 0.0)

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-roam-directory (file-truename (concat org-directory "/roam")))

(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))

(setq org-roam-mode-section-functions
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            ;; #'org-roam-unlinked-references-section
            ))

(setq org-roam-completion-everywhere t)

;; prefer git-timemachine bindings over evil
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(add-to-list 'load-path "~/src/Tidal")
(require 'haskell-mode)
(require 'tidal)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(and
  (require 'centered-cursor-mode)
  (global-centered-cursor-mode +1))

(set-docsets! 'cpp-mode "C++")
(set-docsets! 'haskell-mode "Haskell")
(after!
  (setq lsp-haskell-formatting-provider "brittany"))

(require 'evil-multiedit)
(evil-multiedit-default-keybinds)
;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "s-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "s-d") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "s-d") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "s-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "s-D") 'evil-multiedit-match-and-prev)

;; (map!
;;  :after tidal-mode-map
;;  :leader
;;  :desc "tidal evaluate"
;;  "e" #'tidal-run-multiple-lines)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
