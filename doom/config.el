;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; General configuration for my Doom Emacs environment
;; Author: Theo Park
;; Created: 2023-05-xx
;; Keywords: Emacs, Doom Emacs, Org Mode
;; Copyright (C) 2022-2023 Theo Park
;; This file is licensed under MIT license. See <https://github.com/theopn/dotfiles>

;; Cat: https://www.asciiart.eu/animals/cats
;;      Jonathan added a few layers of belly so it looks more like my cat Oliver
;; Logo: figlet -f small Theomacs
;;  "            \/       \/              "
;;  "            /\_______/\              "
;;  "           /   o   o   \             "
;;  "          (  ==  ^  ==  )            "
;;  "           )           (             "
;;  "          (             )            "
;;  "          ( (  )   (  ) )            "
;;  "         (__(__)___(__)__)           "
;;  ""
;;  "  _   _                              "
;;  " | |_| |_  ___ ___ _ __  __ _ __ ___ "
;;  " |  _| ' \/ -_) _ \ '  \/ _` / _(_-< "
;;  "  \__|_||_\___\___/_|_|_\__,_\__/__/ "
;;  ""

;; Things that Doom does by default that Emacs don't
;; - jk for ESC
;; - Tab character highlighting
;; - Spell checker
;; - Changing backup directory - Doom does in ~/.emacs.d/.local/

;; Info
(setq user-full-name "Theo Park"
      user-mail-address "no.email.for.you@theo.com")

;; Apperance
;; Themes
(when nil
(setq doom-theme 'doom-gruvbox)
(setq doom-theme 'doom-dracula)
)
(setq doom-theme 'doom-tokyo-night)
;; `doom-big-font' may be used for presentation
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 13) ; `describe-font', `eval-region', `doom/reload-font'
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 13)) ; non-monospace font

(setq frame-title-format "%b - Theomacs :)") ; Window title

(setq display-line-numbers-type 'relative) ; t/nil for regular on and off
(setq scroll-margin 10) ; Vim scrolloff

;; File editing
(setq tab-width 2) ; 2 character as tab
(setq backward-delete-char-untabify-method 'hungry) ; Make backspace delete a whole character rather than once space

(setq whitespace-style '(face tabs tab-mark trailing)) ; Trailing whitespace
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363"))))) ; White space appears as red
(setq whitespace-display-mappings
      '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode +1) ; Enable whitespace mode everywhere

;; Go to the matching paren if on a paren; otherwise insert %
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; Custom evil keybindings figure this by using <C-h> k <key u want>
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) ; C-g in insert is ESC
;; C-x o (other-window)
;; C-x { } enlarge/shrink-window-horizontally C-x ^ enlarge-window
;; C-x 0 (delete-window)
;; C-x 2 (split-window-below) C-x 3 (split-window-right)

;; Org config
(load "~/dotfiles/doom.d/org-config.el")

;; Doom Dashboard ascii banner
(defun doom-dashboard-draw-ascii-banner-fn ()
  (let* ((banner
          '(
            ""
            "            \\/       \\/            "
            "            /\\_______/\\            "
            "           /   o   o   \\            "
            "          (  ==  ^  ==  )            "
            "           )           (             "
            "          (             )            "
            "          ( (  )   (  ) )            "
            "         (__(__)___(__)__)           "
            ""
            "  _   _                              "
            " | |_| |_  ___ ___ _ __  __ _ __ ___ "
            " |  _| ' \\/ -_) _ \\ '  \\/ _` / _(_-< "
            "  \\__|_||_\\___\\___/_|_|_\\__,_\\__/__/ "
            ""
            ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat
                 line (make-string (max 0 (- longest-line (length line)))
                                   32)))
               "\n"))
     'face 'doom-dashboard-banner)))
