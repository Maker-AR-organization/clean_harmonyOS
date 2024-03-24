// class Item {
//   name: string
//   image: ResourceStr
//   time: string
//   sorce: string
//
//   constructor(name: string, image: ResourceStr, time: string, sorce: string) {
//     this.name = name
//     this.image = image
//     this.time = time
//     this.sorce = sorce
//   }
// }
//
// @Entry
// @Component
// export struct GarbageSortingPage {
//   // 商品数据
//   private items: Array<Item> = [
//     new Item('华为Mate60', $r('app.media.clean')),
//     new Item('MateBookProX', $r('app.media.clean')),
//     new Item('WatchGT4', $r('app.media.clean')),
//     new Item('FreeBuds Pro3', $r('app.media.clean')),
//     new Item('Mate X5', $r('app.media.clean')),
//     new Item('WatchGT4', $r('app.media.clean')),
//     new Item('Mate X5', $r('app.media.clean'))
//   ]
//
//   build() {
//     Column() {
//       Column({ space: 8 }) {
//         // 标题部分
//         Text('纸盒')
//           .margin({ bottom: 20 })
//           .fontSize(30)
//
//         // 商品列表部分
//         List({ space: 8 }) {
//           ForEach(
//             this.items, (item: Item) => {
//             ListItem() {
//               //商品
//               Row({ space: 10 }) {
//                 Image(item.image)
//                   .width(100)
//                 Column({ space: 4 }) {
//                   if (item.discount) {
//                     Text(item.name)
//                       .fontSize(20)
//                       .fontWeight(FontWeight.Bold)
//                     Text('原价￥' + item.price)
//                       .fontColor('#CCC')
//                       .fontSize(13)
//                       .decoration({ type: TextDecorationType.LineThrough })
//                     Text('现价￥' + (item.price - item.discount))
//                       .fontColor('#F36')
//                       .fontSize(18)
//                     Text('折扣￥' + item.discount)
//                       .fontColor('#F36')
//                       .fontSize(18)
//
//                   }
//                   else {
//                     Text(item.name)
//                       .fontSize(20)
//                       .fontWeight(FontWeight.Bold)
//                     Text('￥' + item.price)
//                       .fontColor('#F36')
//                       .fontSize(18)
//                   }
//
//                 }
//                 .height('100%')
//                 .alignItems(HorizontalAlign.Start)
//               }
//               .width('100%')
//               .backgroundColor('#FFF')
//               .borderRadius(20)
//               .height(120)
//               .padding(10)
//             }
//           }
//           )
//         }
//         .width('100%')
//         .layoutWeight(1)
//       }
//       .width('100%')
//       .height('100%')
//       .backgroundColor('#EFEFEF')
//       .padding(20)
//
//     }
//   }
// }