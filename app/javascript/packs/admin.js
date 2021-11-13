require("./application.js")

require("turbolinks").start()

const feather = require("feather-icons/dist/feather")
document.addEventListener("turbolinks:load", function() {
  feather.replace({
    width: 20,
    height: 20,
    class: "feather-icon",
  });
})

import scrollIntoView from 'smooth-scroll-into-view-if-needed';

Turbolinks.ScrollManager.prototype.scrollToElement = function(element) {
  let classes = element.classList;
  if (classes.contains("highlightable")) {
    classes.add("highlight");
  }
  scrollIntoView(element, {
    behavior: 'smooth',
    scrollMode: 'if-needed',
  });
}