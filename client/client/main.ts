/**
 * Created by ventinc on 19/04/17.
 */

import 'angular2-meteor-polyfills';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { ForefieldModule } from './imports/forefield/forefield.module';

const platform = platformBrowserDynamic();
platform.bootstrapModule(ForefieldModule);