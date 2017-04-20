/**
 * Created by ventinc on 19/04/17.
 */
import {Component, Input, Output, EventEmitter, OnInit} from '@angular/core';
import template from './map.component.html';

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
        console.log("Spots in child : " + this.spots);
        this.dataReady = true;
    }
}