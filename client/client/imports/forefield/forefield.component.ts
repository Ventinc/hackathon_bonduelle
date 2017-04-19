/**
 * Created by ventinc on 19/04/17.
 */
import { Component } from '@angular/core';
import template from './forefield.component.html';

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
    id: number
}

class Handler {

    private showList: boolean = false;
    private currentField: number = -1;
    private currentPlot: number = -1;

    setShowState(state: boolean)
    {
        this.showList = state;
    }

    setCurrentField(id: number)
    {
        this.setShowState(!(id == -1));
        this.currentField = id;
        console.log("Set current field to : " + id);
    }

    setCurrentPlot(id: number)
    {
        this.currentPlot = id;
    }

    isMapActive()
    {
        return this.showList;
    }
}

@Component({
    selector: 'fore-field',
    template
})
export class ForefieldComponent {

    private handler = new Handler();
    private fields: Field[] = [];
    private spots: Marker[] = [];

    constructor() {
        this.fields.push(
            {lng: 20, lat: 10, name: "Field0", id: 0},
            {lng: 21, lat: 10, name: "Field1", id: 1},
            {lng: 22, lat: 10, name: "Field2", id: 2},
            {lng: 23, lat: 10, name: "Field3", id: 3},
            {lng: 24, lat: 10, name: "Field4", id: 4}
        )
    }

    updateField(id: number)
    {
        this.handler.setCurrentField(id);
        if (this.handler.isMapActive()) {
            this.getSpots(id);
        }
    }

    getSpots(id: number)
    {
        // Use id of field to request list of spots in API

        console.log("Pushing spots for field nb : " + id);
        this.spots.push(
            {lat: 10, lng: 20, id: 0},
            {lat: 10, lng: 20.002, id: 1},
            {lat: 10, lng: 20.004, id: 2},
            {lat: 10, lng: 20.006, id: 3},
        );
        console.log("Markers in parent : " + this.spots);
    }

    // Call on API on NgInit for field list
}