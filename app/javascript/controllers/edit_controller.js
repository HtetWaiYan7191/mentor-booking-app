import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["socialLink", "editBtn", "updateBtn"];
    makeInputWriteable(event) {
        const editBtn = event.currentTarget;
        const index = parseInt(editBtn.dataset.index); // Parse index to integer
        const socialLinkTarget = this.socialLinkTargets[index];
        const updateBtnTarget = this.updateBtnTargets[index];
        if (socialLinkTarget) {
            console.log('inside if ')
            editBtn.classList.add("hidden");
            socialLinkTarget.readOnly = false;
            updateBtnTarget.classList.remove('hidden')
        }
    }
    
    updateLink(event) {
        const updateBtn = event.currentTarget;
        const index = parseInt(updateBtn.dataset.index); // Parse index to integer
        const socialLinkTarget = this.socialLinkTargets[index];
        const editBtnTarget = this.editBtnTargets[index];
        updateBtn.classList.add('hidden');
        socialLinkTarget.readOnly = true;
        editBtnTarget.classList.remove('hidden');
    }
    

    connect() {
// Use this.constructor.targets instead of targets
    }

}
