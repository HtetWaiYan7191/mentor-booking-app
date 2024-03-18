import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["socialLink", "editBtn", "updateBtn"];
    makeInputWriteable() {
        if (this.socialLinkTarget) {
            this.editBtnTarget.classList.add("hidden");
            this.socialLinkTarget.readOnly = false;
           this.updateBtnTarget.classList.remove('hidden')
        }
    }

    updateLink() {
        this.updateBtnTarget.classList.add('hidden');
        this.socialLinkTarget.readOnly = true;
        this.editBtnTarget.classList.remove('hidden');
    }

    connect() {
        console.log(this.constructor.targets); // Use this.constructor.targets instead of targets
    }

}
