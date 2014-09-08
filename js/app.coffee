---
---

$(document).ready ->
  console.log 'document is ready'

  $('body').scrollspy
    target: '.bs-docs-sidebar'
    offset: 40
