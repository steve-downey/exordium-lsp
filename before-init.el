;;; before-init.el --- LSP Options and Support

;;; Commentary

;;; Code

;;; code from lsp-mode
(defun exordium--string-vector-p (candidate)
  "Returns true if CANDIDATE is a vector data structure and
every element of it is of type string, else nil."
  (and
   (vectorp candidate)
   (seq-every-p #'stringp candidate)))

(define-widget 'exordium-string-vector 'lazy
  "A vector of zero or more elements, every element of which is a string.
Appropriate for any language-specific `defcustom' that needs to
serialize as a JSON array of strings."
  :offset 4
  :tag "Vector"
  :type '(restricted-sexp
          :match-alternatives (lsp--string-vector-p)))

(defcustom exordium-lsp-clangd-executable ["clangd-11" "clangd-10" "clangd-9" "clangd"]
  "List of executable names to search for to run clangd.
Default is to choose the first that is found via `executable-find'."
  :group 'exordium
  :risky t
  :type 'exordium-string-vector)

(defcustom exordium-lsp-clangd-args '("-j=4" "--background-index" "--log=error" "--clang-tidy")
  "Extra arguments for the clangd executable."
  :group 'exordium
  :risky t
  :type '(repeat string))

(defcustom exordium-enable-which-key t
  "If t, which-key mode will be enabled."
  :group 'exordium
  :type  'boolean)

(defcustom exordium-lsp-keymap-prefix "C-c l"
  "The prefix to bind the lsp keymap to, `kbd' format"
  :group 'exordium
  :type  'string)

(defcustom exordium-lsp-ui-doc-position 'bottom
  "Where to display the doc in LSP mode."
  :group 'exordium
  :type '(choice (const :tag "Top" top)
                 (const :tag "Bottom" bottom)
                 (const :tag "At point" at-point)))

(defcustom exordium-lsp-ui-flycheck-list-position 'bottom
  "Position where `lsp-ui-flycheck-list' will show diagnostics for the whole workspace."
  :group 'exordium
  :type '(choice (const :tag "Bottom" bottom)
                 (const :tag "Right" right)))

(defcustom exordium-lsp-mode-enable t
  "Enable lsp-mode"
  :group 'exordium
  :type 'boolean)


;;; after-init.el ends here
