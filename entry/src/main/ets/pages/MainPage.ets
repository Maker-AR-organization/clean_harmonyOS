import router from '@ohos.router'

@Entry
@Component
struct MainPage {

  @State state: string = "充电完成"
  @State range: string = "0"
  @State time: string = "0"
  @State electric: string = "100"
  @State name: string = "扫拖机器人"

  build() {
    Column() {
      Row() {
        Row() {
        }.width("15%")

        Column() {
          Text(this.name)
            .fontSize(20)
            .margin({
              top: 10,
              bottom: 10
            })
          Text(this.state)
            .fontSize(15)
        }.width("70%")

        Row() {
          Button({ type: ButtonType.Normal }) {
            Image($r("app.media.setting"))
              .height(25)
          }
          .margin({
            left: 10
          })
          .backgroundColor(Color.White)
          .onClick(()=>{
            router.pushUrl({
              url:"pages/SettingPage"
            })
          })
        }.width("15%")
      }.height("12%")

      Row() {
        Column({ space: 8 }) {
          Text(this.range)
          Text("已清扫(m²)")

        }.width("33%")

        Column({ space: 8 }) {
          Text(this.time)

          Text("清扫时间(min)")

        }.width("33%")

        Column({ space: 8 }) {
          Text(this.electric)

          Text("电量(%)")

        }.width("34%")
      }.height("12%")

      Column() {
        Image($r("app.media.background"))
      }.height("70%")
    }.width("100%")
    .height("100%")
  }
}