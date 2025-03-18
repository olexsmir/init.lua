;; extends

(image
  ["!"] @markup.link
  (#set! conceal "🖼️ "))

(image
  [
    "["
    "]"
    "("
    (link_destination)
    ")"
  ] @markup.link
  (#set! conceal ""))
