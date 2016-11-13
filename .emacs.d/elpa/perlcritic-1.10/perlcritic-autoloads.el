;;; perlcritic-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "perlcritic" "perlcritic.el" (22022 49822 0
;;;;;;  0))
;;; Generated autoloads from perlcritic.el

(autoload 'perlcritic "perlcritic" "\
\\[perlcritic]] returns a either nil or t depending on whether the
current buffer passes perlcritic's check. If there are any warnings
those are displayed in a separate buffer.

\(fn)" t nil)

(autoload 'perlcritic-region "perlcritic" "\
\\[perlcritic-region] returns a either nil or t depending on
whether the region passes perlcritic's check. If there are any
warnings those are displayed in a separate buffer.

\(fn START END)" t nil)

(autoload 'perlcritic-mode "perlcritic" "\
Perl::Critic checking minor mode.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; perlcritic-autoloads.el ends here
