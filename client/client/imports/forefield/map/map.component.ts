/**
 * Created by ventinc on 19/04/17.
 */
import {Component, Input, OnInit} from '@angular/core';
import template from './map.component.html';

interface Field
{
    lng: number,
    lat: number,
    name: string,
    id: number
}

interface Marker
{
    lng: number,
    lat: number,
    id: number | string
}

@Component({
    selector: 'map',
    styles: [`
        .sebm-google-map-container {
            height: 300px;
        }
    `],
    template
})
export class MapComponent implements OnInit {
    @Input() private field: Field;
    @Input() private spots: Marker[];
    private dataReady = false;

    constructor() {
    }

    markerClick(mark: Marker)
    {
        console.log(mark);
    }

    ngOnInit()
    {
        console.log("Spots in child : " + this.spots);
        this.dataReady = true;
    }
}