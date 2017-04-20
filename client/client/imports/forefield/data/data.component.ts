/**
 * Created by rubysh on 19/04/17.
 */

import { Component, Input, OnInit } from '@angular/core';
import template from './data.component.html';

interface Spot
{
    id: number
    field_id: number
    longitude: number,
    latitude: number,
    humidities: number[];
}

interface Field
{
    id: number
    longitude: number,
    latitude: number,
    name: string,
    parcels: Spot[]
}

@Component({
    selector: 'data',
    template
})
export class DataComponent implements OnInit {

    private dataReady = false;

    @Input() private field: Field;
    @Input() private spot: Spot;
    @Input() private spots: Spot[];
    private tab : number = 1;

    constructor() {
    }

    ngOnInit()
    {
        console.log("Spot in data : " + JSON.stringify(this.spot));
        this.dataReady = true;
    }

    changeTab(id : number)
    {
        this.tab = id;
    }
}