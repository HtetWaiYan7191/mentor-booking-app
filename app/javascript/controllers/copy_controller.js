import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ["copyBtn"]

    copyUrl(event) { 
        event.preventDefault();
        const currentUrl = window.location.href;
        navigator.clipboard.writeText(currentUrl)
        this.copyBtnTarget.innerText = "Copied Link!"
        setTimeout(() => {
            this.copyBtnTarget.innerText = "Share Link"
        }, 2000)
        // const textarea = document.createElement('textarea')
        // textarea.value = currentUrl
        // document.body.appendChild(textarea)

        // textarea.select();
        // document.execCommand("copy");

        // document.body.removeChild(textarea)
        // this.copyBtnTarget.innerText = "Copied";
        // setTimeout(() => {
        //     this.copyBtnTarget.innerText = "Copy";
        // }, 2000)
    }
}