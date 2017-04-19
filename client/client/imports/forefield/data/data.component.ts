/**
 * Created by rubysh on 19/04/17.
 */

import { Component, Input } from '@angular/core';
import template from './data.component.html';

interface Field
{
    lng: number,
    lat: number,
    name: string,
    id: number
}

interface Spot
{
    lng: number,
    lat: number,
    id: number | string
}

@Component({
    selector: 'data',
    template
})
export class DataComponent {

    @Input() private field: Field;
    @Input() private spot: Spot;

    constructor() {
    }

}