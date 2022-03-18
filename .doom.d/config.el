(setq user-full-name "isaac"
      user-mail-address "isaac@isaac.ac")

(setq doom-font (font-spec :family "SF Mono" :size 13)
      doom-variable-pitch-font (font-spec :family "Helvetica" :size 14))

(setq doom-themes-enable-bold nil)

(use-package org-fancy-priorities
  :diminish
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("•" "•" "•")))


(setq display-line-numbers-type 'relative
      which-key-idle-delay 0.0
      )

(setq org-directory "~/org/"
      org-agenda-remove-tags t
      org-hide-emphasis-markers t
      deft-directory "~/org"
      org-roam-completion-everywhere t
      org-ellipsis "..."
      org-superstar-headline-bullets-list '("◦")
      org-agenda-start-day "+0d" ; today
      org-agenda-show-inherited-tags t
      org-agenda-start-with-log-mode nil
      org-agenda-use-time-grid nil
      org-log-done 'time
      org-startup-folded t
      org-agenda-start-with-clockreport-mode nil
      org-clock-persist 'history
      org-agenda-skip-scheduled-if-done t
      org-agenda-show-current-time-in-grid nil
      org-enforce-todo-dependencies t
      org-agenda-repeating-timestamp-show-all nil
      org-agenda-scheduled-leaders '(" 0 " "-%-2d")
      org-deadline-warning-days 30
      org-agenda-deadline-leaders '("" "+%-2d" "-%-2d")
)

(defun my/org-match-at-point-p (match)
  "Return non-nil if headline at point matches MATCH.
Here MATCH is a match string of the same format used by
`org-tags-view'."
  (funcall (cdr (org-make-tags-matcher match))
           (org-get-todo-state)
           (org-get-tags-at)
           (org-reduced-level (org-current-level))))

(defun my/org-agenda-skip-without-match (match)
  "Skip current headline unless it matches MATCH.

Return nil if headline containing point matches MATCH (which
should be a match string of the same format used by
`org-tags-view').  If headline does not match, return the
position of the next headline in current buffer.

Intended for use with `org-agenda-skip-function', where this will
skip exactly those headlines that do not match."
  (save-excursion
    (unless (org-at-heading-p) (org-back-to-heading))
    (let ((next-headline (save-excursion
                           (or (outline-next-heading) (point-max)))))
      (if (my/org-match-at-point-p match) nil next-headline))))




(org-clock-persistence-insinuate)

;; prefer git-timemachine bindings over evil
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(define-minor-mode git-timemachine-mode
  "Git Timemachine, feel the wings of history."
  :init-value nil
  :lighter " Timemachine"
  :keymap
  '(("j" . git-timemachine-show-previous-revision)
    ("k" . git-timemachine-show-next-revision)
    ("g" . git-timemachine-show-nth-revision)
    ("t" . git-timemachine-show-revision-fuzzy)
    ("q" . git-timemachine-quit)
    ("w" . git-timemachine-kill-abbreviated-revision)
    ("W" . git-timemachine-kill-revision)
    ("b" . git-timemachine-blame)
    ("c" . git-timemachine-show-commit)
    ("?" . git-timemachine-help))
  :group 'git-timemachine)

(add-to-list 'load-path "~/dotfiles")
(require 'auto-dark-emacs)

(add-to-list 'load-path "~/src/Tidal")
(require 'haskell-mode)
(require 'tidal)

(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 60)

(after! org-capture
(setq org-capture-templates
      '(
        ("w" "work")
        ("wt" "todo" entry (file+headline "~/org/org.org" "work todos")
         "* TODO [#C] %?\nSCHEDULED: %t\n")
        ("wm" "meeting" entry (file+headline "~/org/org.org" "work meetings")
         "* %?\n")
        ("p" "priv")
        ("pt" "todo" entry (file+headline "~/org/org.org" "private todos")
         "* TODO [#C] %?\nSCHEDULED: %t\n")
        ("pe" "event" entry (file+headline "~/org/org.org" "private events")
         "* %?\n")
        ("pi" "inbox" entry (file+headline "~/org/org.org" "private inbox")
         "* %?\nfiled at %U\n")
        ("d" "drill" entry (file"~/org/drill.org")
         "* card :drill:\n:PROPERTIES:\n:DRILL_CARD_TYPE: twosided\n:END:\n** front\n%?\n** back")
        ))
)

(after! org-agenda
    (setq org-agenda-custom-commands
          '(
            ("a" "all" ((agenda "" ((org-agenda-span 1)
                                    (org-agenda-overriding-header "" )
                                    (org-agenda-prefix-format "%-12t %-4T %s ")
                                    (org-agenda-format-date "%a %d %b")
                                    ))) ((org-agenda-compact-blocks t)))
            ("w" "work" ((agenda "" ((org-agenda-span 1)
                                    (org-agenda-overriding-header "" )
                                    (org-agenda-prefix-format "%-12t %-4T %s")
                                    (org-agenda-format-date "%a %d %b")
                                    (org-agenda-skip-function '(my/org-agenda-skip-without-match "work"))
                                    ))) ((org-agenda-compact-blocks t)))
            ("p" "priv" ((agenda "" ((org-agenda-span 1)
                                    (org-agenda-overriding-header "" )
                                    (org-agenda-prefix-format "%-12t %-4T %s")
                                    (org-agenda-format-date "%a %d %b")
                                    (org-agenda-skip-function '(my/org-agenda-skip-without-match "priv"))
                                    ))) ((org-agenda-compact-blocks t)))
            ("g" "gold" ((agenda "" ((org-agenda-span 1)
                                    (org-agenda-overriding-header "" )
                                    (org-agenda-prefix-format "%-12t %-4T %s")
                                    (org-agenda-format-date "%a %d %b")
                                    (org-agenda-skip-function '(my/org-agenda-skip-without-match "gold"))
                                    ))) ((org-agenda-compact-blocks t)))
          ))
  (evil-set-initial-state 'org-agenda-mode 'normal)
  (evil-define-key 'normal org-agenda-mode-map
          (kbd "<RET>") 'org-agenda-switch-to
          (kbd "\t") 'org-agenda-goto
          "s" 'org-agenda-schedule
          "A" 'org-agenda-archive
          "w" 'org-agenda-week-view
          "d" 'org-agenda-day-view
          "t" 'org-agenda-todo
          "L" 'org-agenda-log-mode
          "q" 'org-agenda-quit
          "R" 'org-agenda-clockreport-mode
          "r" 'org-agenda-redo
          "[" 'org-agenda-earlier
          "]" 'org-agenda-later
          "," 'org-agenda-goto-today
          "i" 'org-agenda-clock-in
          "o" 'org-agenda-clock-out
          "=" 'org-agenda-priority-up
          "-" 'org-agenda-priority-down
        )
)

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

(display-time-mode 1)
(setq display-time-24hr-format 1)

(require 'epa-file)
(epa-file-enable)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

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
