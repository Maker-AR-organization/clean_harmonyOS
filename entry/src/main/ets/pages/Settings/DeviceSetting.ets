import router from '@ohos.router'

@Entry
@Component
struct DeviceSetting {
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

        Text("设备设置")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("12%")

      Column() {
        Column() {
          Row() {
            Text("设备所在时区")
              .fontSize(20)
              .width("90%")
            Button({ type: ButtonType.Normal }) {
              Image($r("app.media.into"))
                .width(20)
            }
            .width("10%")
            .height(30)
            .backgroundColor(Color.White)
            .onClick(() => {
              router.pushUrl({
                url: "pages/Settings/DeviceTimeZone"
              })
            })
          }.height("25%")

          Row() {
            Text("音量设置")
              .fontSize(20)
              .width("90%")
            Button({ type: ButtonType.Normal }) {
              Image($r("app.media.into"))
                .width(20)
            }
            .width("10%")
            .height(30)
            .backgroundColor(Color.White)
            .onClick(() => {
              router.pushUrl({
                url: "pages/Settings/VolumeSetting"
              })
            })
          }.height("25%")

          Row() {
            Text("勿扰模式")
              .fontSize(20)
              .width("80%")
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0x39a2db)
              .switchPointColor(0xe5ffffff)
              .width("20%")
              .size({ width: 56, height: 56 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
          }.height("25%")

          Row() {
            Text("消息提醒开发")
              .fontSize(20)
              .width("80%")
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0x39a2db)
              .switchPointColor(0xe5ffffff)
              .width("20%")
              .size({ width: 56, height: 56 })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
          }.height("25%")
        }.height("40%")
        .padding(20)

        Column() {
        }.height("60%")
      }.height("88%")
    }.width('100%')
    .height('100%')
  }
}