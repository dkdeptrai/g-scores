import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu", "toggleButton", "overlay", "container"]

  connect() {
    this.checkScreenSize()
    window.addEventListener("resize", this.checkScreenSize.bind(this))
  }

  disconnect() {
    window.removeEventListener("resize", this.checkScreenSize.bind(this))
  }
  open() {
    this.menuTarget.classList.remove("hidden")
  }

  close() {
    this.menuTarget.classList.add("hidden")
  }

  checkScreenSize(){
    if (window.innerWidth > 768) {
      this.open()
    } else {
      this.close()
    }
  }
  toggle() {
    if (this.menuTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }
}
