/**
 * Created by ventinc on 19/04/17.
 */
import {Component, Input, Output, EventEmitter, OnInit} from '@angular/core';
import template from './map.component.html';

interface Spot
{
    id: number
    field_id: number
    longitude: number,
    latitude: number,
    humidities: number[];
}

interface Crop
{
    id: number,
    name: string,
    quantity: number,
    harvest: string,
    created: string,
    updated: string,
    field_id: number
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
    @Input() private crop: Crop;
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

    getCurrentCulture(culture)
    {
        if (culture[0]) {
            console.log("Culture in map data : " + JSON.stringify(culture[0].name));
            return culture[0].name;
        }
        else {
            return "None";
        }
    }
}