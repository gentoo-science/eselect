;;; eselect-mode.el --- edit eselect files

;; Copyright (c) 2006-2014 Gentoo Foundation

;; Author: Matthew Kennedy <mkennedy@gentoo.org>
;;	Diego Pettenò <flameeyes@gentoo.org>
;;	Christian Faulhammer <fauli@gentoo.org>
;;	Ulrich Müller <ulm@gentoo.org>
;; Maintainer: <emacs@gentoo.org>
;; Keywords: languages

;; This file is part of the 'eselect' tools framework.

;; eselect is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; eselect is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with eselect.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'sh-script)
(require 'font-lock)

;;; Font-lock.

(defvar eselect-mode-keywords-warn
  '(("eval")
    font-lock-warning-face))

(defvar eselect-mode-keywords-core
  '(("die" "check_do" "do_action" "inherit" "sed")
    font-lock-type-face))

(defvar eselect-mode-keywords-output
  '(("write_error_msg" "write_warning_msg" "write_list_start"
     "write_numbered_list_entry" "write_kv_list_entry"
     "write_numbered_list" "highlight" "highlight_warning"
     "highlight_marker" "is_output_mode" "space")
    font-lock-type-face))

(defvar eselect-mode-keywords-tests
  '(("has" "is_function" "is_number")
    font-lock-type-face))

(defvar eselect-mode-keywords-path-manipulation
  '(("basename" "dirname" "canonicalise" "relative_name")
    font-lock-type-face))

(defvar eselect-mode-keywords-config
  '(("store_config" "load_config" "append_config")
    font-lock-type-face))

(defvar eselect-mode-keywords-multilib
  '(("list_libdirs")
    font-lock-type-face))

(defvar eselect-mode-keywords-package-manager
  '(("arch" "envvar" "best_version" "has_version" "get_repositories"
     "get_repo_news_dir" "env_update")
    font-lock-type-face))

(defun eselect-mode-make-keywords-list (keywords-list face
						      &optional prefix suffix)
  ;; based on `generic-make-keywords-list' from generic.el
  ;; Note: XEmacs doesn't have generic.el
  (unless (listp keywords-list)
    (error "Keywords argument must be a list of strings"))
  (cons (concat prefix "\\<"
		(regexp-opt keywords-list t)
		"\\>" suffix)
	face))

(defvar eselect-mode-font-lock-keywords
  (mapcar
   (lambda (x) (apply 'eselect-mode-make-keywords-list x))
   (list
    eselect-mode-keywords-warn
    eselect-mode-keywords-core
    eselect-mode-keywords-output
    eselect-mode-keywords-tests
    eselect-mode-keywords-path-manipulation
    eselect-mode-keywords-config
    eselect-mode-keywords-multilib
    eselect-mode-keywords-package-manager)))

;;; Mode definitions.

(defun eselect-mode-before-save ()
  ;;(delete-trailing-whitespace)	; doesn't exist in XEmacs
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (delete-region (match-beginning 0) (point))))
  ;; return nil, otherwise the file is presumed to be written
  nil)

;;;###autoload
(define-derived-mode eselect-mode shell-script-mode "Eselect"
  "Major mode for .eselect files."
  (if (featurep 'xemacs)
      (make-local-hook 'write-contents-hooks))
  (add-hook 'write-contents-hooks 'eselect-mode-before-save t t)
  (sh-set-shell "bash")
  (setq tab-width 4)
  (setq indent-tabs-mode t))

(add-hook 'eselect-mode-hook
	  (lambda () (font-lock-add-keywords
		      nil eselect-mode-font-lock-keywords)))


;;;###autoload
(add-to-list 'auto-mode-alist '("\\.eselect\\'" . eselect-mode))

(provide 'eselect-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; eselect-mode.el ends here
