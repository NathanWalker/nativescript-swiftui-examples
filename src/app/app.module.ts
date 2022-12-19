import { NgModule, NO_ERRORS_SCHEMA } from "@angular/core";
import { NativeScriptModule } from "@nativescript/angular";

import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { HomeComponent } from "./home.component";
import { EXAMPLE_COMPONENTS } from "./examples";

@NgModule({
  bootstrap: [AppComponent],
  imports: [NativeScriptModule, AppRoutingModule],
  declarations: [AppComponent, HomeComponent, ...EXAMPLE_COMPONENTS],
  providers: [],
  schemas: [NO_ERRORS_SCHEMA],
})
export class AppModule {}
