import router from '@ohos.router'

@Entry
@Component
struct DeviceName {
  private select: number = 1
  private fruits: string[] = ['扫拖机器人C1', '扫地机器人C3', '扫地机器人C2', '扫拖机器人B1']

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

        Text("修改设备名称")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("12%")

      Column() {
        TextPicker({range: this.fruits, selected: this.select})
          .onChange((value: string, index: number) => {
            console.info('Picker item changed, value: ' + value + ', index: ' + index)
          })
          .margin({
            top:200
          })
      }.height("88%")
    }.width('100%')
    .height('100%')
  }
}