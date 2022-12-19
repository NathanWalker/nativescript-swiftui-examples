import { Component } from "@angular/core";
import { Color, CoreTypes, Label } from "@nativescript/core";
import {
  registerSwiftUI,
  SwiftUIEventData,
  UIDataDriver,
} from "@nativescript/swift-ui";

declare var CardProvider: any;
registerSwiftUI(
  "card",
  (view) => new UIDataDriver(CardProvider.alloc().init(), view)
);

interface ISwiftUIData {
  title?: string;
  titleColor?: UIColor;
  desc?: string;
  descColor?: UIColor;
  subTitle?: string;
  subTitleColor?: UIColor;
  cardBackgroundColor?: UIColor;
}
@Component({
  selector: "ns-card",
  templateUrl: "./card.component.html",
})
export class CardComponent {
  label: Label;
  swiftUIData: ISwiftUIData = {
    title: "Learn SwiftUI ",
    titleColor: new Color('white').ios,
    desc: "with NativeScript from Angular?",
    subTitle: "Cool!",
    cardBackgroundColor: new Color('black').ios
  };

  swiftUIEvent(args: SwiftUIEventData<{ showing?: boolean }>) {
    this.label
      .animate({
        opacity: args.data.showing ? 0 : 1,
        translate: { x: 0, y: args.data.showing ? 60 : 0 },
        curve: CoreTypes.AnimationCurve.easeInOut,
      })
      .catch(() => {});
  }

  loadedLabel(args) {
    this.label = args.object;
  }
}
