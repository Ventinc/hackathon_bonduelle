/**
 * Created by ventinc on 19/04/17.
 */
import { Component } from '@angular/core';
import template from './forefield.component.html';
import { HTTP } from 'meteor/http';

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
    parcels: Spot[],
    culture: Crop[]
}

class Handler {

    private showList: boolean = false;
    private currentField: number = -1;
    private currentSpot: number = -1;

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

    setCurrentSpot(id: number)
    {
        this.currentSpot = id;
    }

    getCurrentField()
    {
        return this.currentField;
    }

    getCurrentSpot()
    {
        return this.currentSpot;
    }
}

@Component({
    selector: 'fore-field',
    template
})
export class ForefieldComponent {

    private handler = new Handler();
    private fields: Field[] = [];
    private crops: Crop[] = [];
    private spots: Spot[] = [];
    private spotData: Spot = undefined;

    constructor() {

        try {
            const callResult = HTTP.call('GET', 'http://127.0.0.1:8080/api/v1/fields', {}, (error, result) => {
                if (!error) {
                    console.log("Result : " + JSON.stringify(result));
                    this.fields = result.data;
                    console.log("Fields : " + this.fields);

                    this.fields.forEach( (field) => {
                        try {
                            console.log("Request crop with : http://127.0.0.1:8080/api/v1/field/" + field.id + '/crops/lastest');
                            const callResult = HTTP.call('GET', 'http://127.0.0.1:8080/api/v1/field/' + field.id + '/crops/lastest', {}, (error, result) => {
                                if (!error) {
                                    console.log("Field : " + JSON.stringify(field));
                                    console.log("Result Crops : " + JSON.stringify(result));
                                    field.culture = [result.data];
                                    console.log("Crops : " + JSON.stringify(field.culture));
                                }
                                else {
                                    console.log("Error GET : " + error);
                                }
                            });
                        } catch (e) {
                            // Got a network error, timeout, or HTTP error in the 400 or 500 range.
                            console.log("Fail api call : " + e);
                        }
                    });
                }
                else {
                    console.log("Error GET : " + error);
                }
            });
        } catch (e) {
            // Got a network error, timeout, or HTTP error in the 400 or 500 range.
            console.log("Fail api call : " + e);
        }
    }

    updateField(id: number)
    {
        this.handler.setCurrentField(id - 1);
        this.getSpots(id);
    }

    resetField()
    {
        this.handler.setCurrentField(-1);
        this.handler.setCurrentSpot(-1);
        this.spots = [];
        console.log("Spots after reset : " + JSON.stringify(this.spots));
    }

    getSpots(id: number)
    {
        // Use id of field to request list of spots in API

        console.log("Get request : http://127.0.0.1:8080/api/v1/field/" + id + "/parcels");
        try {
            const callResult = HTTP.call('GET', 'http://127.0.0.1:8080/api/v1/field/' + id + "/parcels", {}, (error, result) => {
                if (!error) {
                    console.log("Result : " + JSON.stringify(result));
                    this.spots = result.data;
                    console.log("Spots Parent : " + JSON.stringify(this.spots));
                    //this.spots =result.data;
                }
                else {
                    console.log("Error GET : " + error);
                }
            });
            console.log("success API call, data : " + callResult);
        } catch (e) {
            // Got a network error, timeout, or HTTP error in the 400 or 500 range.
            console.log("Fail api call : " + e);
        }
    }

    getSpotData(event)
    {
        console.log("=== Api Call for Spot eventHandler ===");
        console.log("Id of spot : " + event.id);
        for (var i = 0 ; i < this.spots.length ; i++) {
            if (this.spots[i].id == event.id) {
                console.log("Found at index : " + i);
                this.handler.setCurrentSpot(i);
            }
        }
//        this.handler.setCurrentSpot(i);
        console.log("Should ask for Spot n°" + this.fields[this.handler.getCurrentField()].id + " of field n°" + this.handler.getCurrentField())


        console.log("Get request : http://127.0.0.1:8080/api/v1/field/" + this.fields[this.handler.getCurrentField()].id + "/parcel/" + event.id);
        try {
            const callResult = HTTP.call('GET', 'http://127.0.0.1:8080/api/v1/field/' + this.fields[this.handler.getCurrentField()].id + "/parcel/" + event.id, {}, (error, result) => {
                if (!error) {
                    console.log("Result : " + JSON.stringify(result));
                    this.spotData = result.data;
                    console.log("Spot DATA Parent : " + JSON.stringify(this.spotData));
                    //this.spots =result.data;
                }
                else {
                    console.log("Error GET : " + error);
                }
            });
            console.log("success API call, data : " + callResult);
        } catch (e) {
            // Got a network error, timeout, or HTTP error in the 400 or 500 range.
            console.log("Fail api call : " + e);
        }

    }

    getCurrentCulture(field)
    {
        if (field.culture[0]) {
            console.log("Field data : " + JSON.stringify(field.culture[0].name));
            return field.culture[0].name;
        }
        else {
            return "None";
        }
    }

    // Call on API on NgInit for field list + dataReady Wrapper ?
}