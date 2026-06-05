import { LightningElement } from 'lwc';

export default class Selector extends LightningElement {
    selectedProductId;
    name = 'Electra X4';

    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
}