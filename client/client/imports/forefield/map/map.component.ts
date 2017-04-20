/**
 * Created by ventinc on 19/04/17.
 */
import {Component, Input, Output, EventEmitter, OnInit} from '@angular/core';
import template from './map.component.html';
import * as $  from 'jquery';

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
    selector: 'map',
    template
})
export class MapComponent implements OnInit {

    private dataReady = false;

    @Input() private field: Field;
    @Input() private spots: Spot[];
    @Output() public spotSelect: EventEmitter<Spot> = new EventEmitter<Spot>();
    private spotSelected : boolean = false;

    constructor() {
    }

    markerClick(mark: Spot)
    {
        console.log(mark);
        this.spotSelected = true;
        this.spotSelect.emit(mark);
    }

    ngOnInit()
    {
        console.log("Spots in child : " + JSON.stringify(this.spots));
        this.dataReady = true;
    }
}