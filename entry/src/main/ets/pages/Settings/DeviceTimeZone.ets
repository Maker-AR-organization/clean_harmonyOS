import router from '@ohos.router'
@Entry
@Component
struct DeviceTimeone {
  @State outSetValueOne: number = 40;
  build() {
    Column() {
      Row() {
        Button({ type: ButtonType.Normal }) {
          Image($r("app.media.back"))
        }
        .width("10%")
        .height(30)
        .backgroundColor(Color.White)
        .onClick(() => {
          router.pushUrl({
            url: "pages/Settings/DeviceSetting"
          })
        })

        Text("设备所在时区")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("12%")

      Column() {
        Text("可以将手机所在时区同步到设备，请确保手机和设备处在同一时区")
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .height("10%")
          .padding(20)
        Text("现在同步")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .height("10%")
          .margin({
            right:230
          })
        Text("*设备时区不准确，可能造成定时清扫和勿扰模式时间紊乱")
          .fontSize(15)
          .height("10%")
          .padding(20)
      }.height("88%")
    }.width('100%')
    .height('100%')
  }
}