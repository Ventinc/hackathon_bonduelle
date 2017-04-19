/**
 * Created by ventinc on 19/04/17.
 */
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ForefieldComponent } from './forefield.component';

@NgModule({
    imports: [
        BrowserModule
    ],
    declarations: [
        ForefieldComponent
    ],
    bootstrap: [
        ForefieldComponent
    ]
})
export class ForefieldModule {}