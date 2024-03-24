import router from '@ohos.router'

@Entry
@Component
struct CleanRecord {
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

        Text("清扫记录")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("12%")

      Column() {
        Row() {
          Column({ space: 8 }) {
            Text(this.time)
              .fontSize(20)
            Text("累计时长(h)")

          }.width("33%")

          Column({ space: 8 }) {
            Text(this.range)
              .fontSize(20)
            Text("累计面积(m²)")

          }.width("33%")

          Column({ space: 8 }) {
            Text(this.count)
              .fontSize(20)
            Text("累计次数")

          }.width("34%")
        }.height("20%")
        Stack(){
          Column({space:20}){
            Image($r("app.media.file"))
              .height(40)
            Text("记录为空")
              .fontSize(20)
          }.margin({
            bottom:25
          })
        }.height("80%")
      }.height("88%")
    }.width('100%')
    .height('100%')
  }
}