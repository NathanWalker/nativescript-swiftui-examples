import { NgModule } from "@angular/core";
import { Routes } from "@angular/router";
import { NativeScriptRouterModule } from "@nativescript/angular";
import { HomeComponent } from "./home.component";
import { CardComponent } from "./examples/card.component";

const routes: Routes = [
  { path: "", redirectTo: "/examples/card", pathMatch: "full" },
  { path: "home", component: HomeComponent },
  { path: "examples/card", component: CardComponent },
];

@NgModule({
  imports: [NativeScriptRouterModule.forRoot(routes)],
  exports: [NativeScriptRouterModule],
})
export class AppRoutingModule {}
