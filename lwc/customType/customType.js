import LightningDatatable from 'lightning/datatable';
import customType from './customType.html';


export default class CustomType extends LightningDatatable {
    static customTypes = {
        customImage: {
            template: customType,
            standardCellLayout: true,
            typeAttributes: ['imageSRC']
        }
    }
}