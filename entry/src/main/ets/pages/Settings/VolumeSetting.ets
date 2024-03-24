import router from '@ohos.router'
@Entry
@Component
struct VolumeSetting {
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

        Text("音量设置")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("12%")

      Column() {
        Text("可拖动调节设备语音音量大小")
          .fontSize(17)
          .height("10%")
        Row(){
          Image($r("app.media.music_small"))
            .width("8%")
          Slider({
            value: this.outSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .width("84%")
            .showTips(true)
            .onChange((value: number, mode: SliderChangeMode) => {
              this.outSetValueOne = value;
              console.info('value:' + value + 'mode:' + mode.toString());
            })
          Image($r("app.media.music_big"))
            .width("8%")
        }.width("90%")
        .margin({
          top:70
        })
      }.height("88%")
    }.width('100%')
    .height('100%')
  }
  }