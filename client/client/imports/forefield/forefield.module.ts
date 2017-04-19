/**
 * Created by ventinc on 19/04/17.
 */
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ForefieldComponent } from './forefield.component';
import { MapComponent } from "./map/map.component";
import { DataComponent } from "./data/data.component";
import { AgmCoreModule } from 'angular2-google-maps/core';

@NgModule({
    imports: [
        BrowserModule,
        AgmCoreModule.forRoot({
            apiKey: "AIzaSyBWTdeu8Tz50bBt8zD5p0gpTO2HC2xRFvg"
        })
    ],
    declarations: [
        ForefieldComponent,
        MapComponent,
        DataComponent
    ],
    bootstrap: [
        ForefieldComponent
    ]
})
export class ForefieldModule {}