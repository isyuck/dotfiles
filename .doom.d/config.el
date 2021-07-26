(setq user-full-name "Isaac S"
      user-mail-address "isaac@isaac.ac")

(setq doom-font (font-spec :family "JetBrains Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "Nimbus Sans" :size 16))

(setq doom-theme 'doom-plain)

(setq org-directory "~/org/")
(setq display-line-numbers-type 'relative)

(add-to-list 'load-path "~/src/Tidal")
(require 'haskell-mode)
(require 'tidal)

(map!
 :after tidal-mode-map
 :leader
 :desc "tidal evaluate"
 "e" #'tidal-run-multiple-lines)

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
