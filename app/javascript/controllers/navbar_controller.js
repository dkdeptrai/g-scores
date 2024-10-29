import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu", "toggleButton", "overlay"]
  connect() {

  }

  open() {
    this.overlayTarget.classList.add("hidden");
    this.menuTarget.classList.remove("hidden")
  }

  close() {
    this.overlayTarget.classList.remove("hidden");
    this.menuTarget.classList.add("hidden")
  }
  toggle() {
    if (this.menuTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }
}
