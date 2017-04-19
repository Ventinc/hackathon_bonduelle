/**
 * Created by ventinc on 19/04/17.
 */
import {Component, Input} from '@angular/core';
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
export class MapComponent {
    private markers: Marker[] = [];
    @Input() private field: Field = {
        lat: 10,
        lng: 20,
        id: 234,
        name: "Champs de fleurs"
    };

    constructor() {
        this.markers.push(
            {lat: 10, lng: 20, id: 10},
            {lat: 10, lng: 20.002, id: 9},
            {lat: 10, lng: 20.004, id: 8},
            {lat: 10, lng: 20.006, id: 7},
        );
    }

    markerClick(mark: Marker)
    {
        console.log(mark);
    }

}