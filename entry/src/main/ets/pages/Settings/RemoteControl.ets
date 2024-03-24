import router from '@ohos.router'

@Entry
@Component
struct RemoteControl {
  @State range: string = "0"
  @State time: string = "0"
  @State count: string = "0"

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
            url: "pages/SettingPage"
          })
        })

        Text("遥控器")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("12%")

      Column() {
        Image($r("app.media.remote"))
          .height(250)
          .margin({
            top:200
          })
      }.height("88%")
    }.width('100%')
    .height('100%')
  }
}