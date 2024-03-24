import router from '@ohos.router'
@Entry
@Component
struct ExperimentalFunction {
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

        Text("实验功能")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("12%")
      Column() {
        Column(){
          Text("地图保存模式")
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .height("20%")
            .margin({
              right:200
            })
          Row(){
            Text("开启后随着智能地图不断完善，可实现保存地图，设置软件虚拟墙，禁区等。")
              .fontSize(15)
              .width("70%")
              .margin({
                right:10
              })
            Toggle({ type: ToggleType.Switch, isOn: false })
              .selectedColor(0x39a2db)
              .switchPointColor(0xe5ffffff)
              .width("30%")
              .size({ width: 56, height: 56 })
              .margin({
                bottom:15
              })
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
              })
          }.height("80%")
        }.height("20%")
        Column(){
        }.height("80%")
      }.height("88%")
    }.width('100%')
    .height('100%')

  }
}