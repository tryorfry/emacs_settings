(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Paths for elisp:
;; load the elisp mentioned here. load path ~/elisp doesn't work in windows be careful.

(add-to-list 'load-path (expand-file-name "~/elisp"))
;; by default 'auto-install packages are stored in this directory
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugin"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(case-fold-search t)
 '(column-number-mode t)
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-tab-always-indent t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(font-lock-maximum-size 512000)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(paren-mode (quote paren) nil (paren))
 '(setq-default indent-tabs-mode t)
 '(show-paren-mode t nil (paren))
 '(sort-fold-case t t)
 '(tab-width 4)
 '(transient-mark-mode t)
 '(user-mail-address "sachindangol@gmail.com"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; set line width to 78 columns.
(setq fill-column 78)
(setq auto-fill-mode t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(global-auto-complete-mode t)
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
;;
;;; Tips:
;; Use C-n/C-p to select candidates
;; --------------------------------
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;
;; Don't start completion automatically
;; ------------------------------------
;; (setq ac-auto-start nil)
;; (global-set-key "\M-/" 'ac-start)
;;   or
;; start completion when entered 4 characters
(setq ac-auto-start 4)
;;
;; Stop completion
;; --------------
(define-key ac-complete-mode-map "\M-/" 'ac-stop)
;; Now you can stop completion by pressing M-/.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist
      (append '(
                ("\\.org$" . org-mode)                
                ("\\.pl$" . cperl-mode)
                ("\\.t$" . cperl-mode)                
                ("\\.pm$" . cperl-mode)
                ("\\.esp$" . cperl-mode)
                ("\\.sql$" . sql-mode)
                ("\\.tbl$" . sql-mode)
                ("\\.js$" . js2-mode)
                ("\\.css$" . css-mode)
                ("\\.scss$" . css-mode)
                ("\\.less$" . less-css-mode)
                ("\\.json$" . json-mode)
                ("\\.outline$" . outline-mode)
                ("\\.ses$" . ses-mode)
;;                ("\\.html$" . multi-web-mode)
                ("\\.pdf$" . doc-view-mode)                
                )
              auto-mode-alist))

;; theme?!
(set-foreground-color "white")
(set-background-color "black")


;; easy installation of the elisp. Example: auto-install-from-urlwill install an elisp file from given URL
(require 'auto-install)
;; auto update on every emacs start-up. Experimental - remove if it annoys
;; (auto-install-update-emacswiki-package-name t)

;;; --- eshell --- By the way there are 3 shells in emacs:
;; eshell, shell and term( ansi-term). ansi-term is the best if you need OS terminal emulater. In Windows use eshell. 
;; Bash like auto-completion for eshell .. IMPORTANT!! run .bash_profile when eshell or term starts.
;; alias mv -i is set as alias and if not careful then mv -rf will delete all files.
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)
   ))

;; a muti terminal in emacs. Try out muti-eshell as well.
(require 'multi-term)

;; "pdf files opens in emacs doc-view-mode" i( graphical interface(not terminal) && ghostscript program is installed)
;; brew install ghostscript
;; folowing key binding is helpful. open two windows and from other windows scroll the pdf page M-[ or M-] cool.
(fset 'doc-prev "\C-xo\C-x[\C-xo")
(fset 'doc-next "\C-xo\C-x]\C-xo")
(global-set-key (kbd "M-[") 'doc-prev)
(global-set-key (kbd "M-]") 'doc-next)


;; no annoying backfiles please. git is there if you want version controlling
(setq make-backup-files nil) 


(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cp" 'perl-mode)
(transient-mark-mode t)

(put 'upcase-region 'disabled nil)

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening


;; ========== Line by line scrolling ==========

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)

;; ========== Support Wheel Mouse Scrolling ==========
(mouse-wheel-mode t)


;; ===== rememberes the line in the file last visited ===== The trick is save the last line in a file 'saveplace'
(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package

;;remove the useless menubar 'file' 'edit' . Turn of in xserver as well (run .Xresources with xrdb .Xresources) with this change It should be much faster!
(menu-bar-mode nil)
(tool-bar-mode nil)
(scroll-bar-mode nil)


;; rails environment
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(require 'ido)
(ido-mode t)


(autoload 'ruby-mode "ruby-mode"
		 "Mode for editing ruby source files" t)
		(setq auto-mode-alist
				  (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
		(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                 interpreter-mode-alist))

;; It's All text for chrome
(require 'edit-server)
(edit-server-start)

(add-hook 'edit-server-text-mode-hook
            (lambda ()(progn()
              (auto-complete-mode)
              (flyspell-mode))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Perl stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defalias 'perl-mode 'cperl-mode)

;; autocomplete for perl:
(add-hook  'cperl-mode-hook
           (lambda ()
             (require 'auto-complete)
             (auto-complete-mode t)
             (flymake-mode t)
             (auto-fill-mode 1) ; =wordwrap
             (local-set-key (kbd "C-h f") 'cperl-perldoc)  ;; perldoc with c-h f
             (make-variable-buffer-local 'ac-sources)
             (setq ac-sources
                   '(ac-source-perl-completion))))

;; ok, dont use default keybinds.
;; (setq plcmp-use-keymap nil)
;; Basic commands:
;;      c-Tab or c-Enter for autocomplete suggestions.
;;      more options M-x plcmp tab
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
                        (perl-completion-mode t)))

;; easy perl eval - perl-completion has this eval too acutally more fancy.s
(defun perl-eval (beg end)
        (interactive "r")
          (shell-command-on-region  beg end "perl"))
(global-set-key "\M-\C-P" 'perl-eval)


;; Perl outline mode
;; Then do M-x perl-outline-mode after you opened the Perl code file
;; Expand:  C-c @ C-t
;; contract a function: C-c @ C-s
;; Contract All: C-c @ C-a
;; Expand All: C-c @ C-d
(defun perl-outline-mode ()
  "set customized outline minor mode for Perl"
  (interactive)
  (setq outline-regexp "sub")
  (outline-minor-mode))


;; python mode hooks
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset tab-width)
                    (set-variable 'indent-tabs-mode nil))))
;; has auto-complete
(add-hook 'python-mode-hook 'elpy-mode)

;; a mode which is suitable for web page ( HTML, JavaScript, CSS and embedded perl/ruby/etc)
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags 
;;   '((ruby-mode "<\\% \\|<\\%=" "\\%>")
;;     (js2-mode  "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;     (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "erb" "esp"))
;; (multi-web-global-mode 1)
;; (add-hook 'multi-web-mode-hook
;;           (lambda ()(progn()
;;                           (auto-complete-mode))))
              



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General stuffs:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))
;; Use % to match various kinds of brackets ..
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

