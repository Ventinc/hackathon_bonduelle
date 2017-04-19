/**
 * Created by ventinc on 19/04/17.
 */
import { Component } from '@angular/core';
import template from './forefield.component.html';

@Component({
    selector: 'fore-field',
    template
})
export class ForefieldComponent {
    private field: boolean = false;

    constructor() {
        this.field = false;
    }

    getField(id: number)
    {
        this.field = true;
    }

    removeField()
    {
        this.field = false;
    }
}