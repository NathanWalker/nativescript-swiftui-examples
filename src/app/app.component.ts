import { Component } from '@angular/core'
import { registerElement } from '@nativescript/angular'
import { SwiftUI } from '@nativescript/swift-ui'

// this can be done really anywhere
// it's often done in root app.component to make it available for use anywhere
registerElement('SwiftUI', () => SwiftUI);

@Component({
  selector: 'ns-app',
  templateUrl: './app.component.html',
})
export class AppComponent {}
