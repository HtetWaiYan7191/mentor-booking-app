import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["socialLink", "editBtn", "updateBtn"];
    makeInputWriteable(event) {
        const editBtn = event.currentTarget;
        const index =  editBtn.dataset.index;
        const socialLinkTarget = this.socialLinkTargets[index];
        const updateBtnTarget = this.updateBtnTargets[index];
        console.log(updateBtnTarget);
        if (socialLinkTarget) {
            event.currentTarget.classList.add("hidden");
            socialLinkTarget.readOnly = false;
           updateBtnTarget.classList.remove('hidden')
        }
    }

    updateLink() {
        this.updateBtnTarget.classList.add('hidden');
        this.socialLinkTarget.readOnly = true;
        this.editBtn.classList.remove('hidden');
    }

    connect() {
        console.log('connect');
        console.log(this.constructor.targets); // Use this.constructor.targets instead of targets
    }

}
