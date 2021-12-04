import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "form", "preview" ]

  showMarquee(event) {
    // console.log(event.currentTarget.id);
    const marqueeTarget = this.previewTarget.contentWindow.document.querySelector(`.${event.currentTarget.id}`);
    if (marqueeTarget) {
      marqueeTarget.classList.add("marquee");
    }
  }

  startEditing(event) {
    this.currentlyEditing = event.currentTarget;
  }

  stopEditing(event) {
    this.currentlyEditing = null;
  }
  
  hideMarquee(event) {
    // console.log(event.currentTarget.id);
    const marqueeTarget = this.previewTarget.contentWindow.document.querySelector(`.${event.currentTarget.id}`);
    if (marqueeTarget) {
      marqueeTarget.classList.remove("marquee");
    }
  }

  update(event) {
    // This works for both input elements and trix editors.
    const value = event.currentTarget.value;
    console.log(value);
    const div = this.previewTarget.contentWindow.document.querySelector(`.${event.currentTarget.id} div`);
    div.innerHTML = value;
  }

  connect() {
    console.debug(this.formTarget, this.previewTarget);
  }
}
