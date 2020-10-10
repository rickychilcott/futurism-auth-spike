// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    const queryString = window.location.search
    const urlParams = new URLSearchParams(queryString)

    if (urlParams.get("showAll")) {
      this.show()
    }
  }

  show(event) {
    if (event) {
      event.preventDefault()
    }

    if (this.hasContentTarget) {
      this.contentTarget.removeAttribute("hidden")
    }
  }
}
