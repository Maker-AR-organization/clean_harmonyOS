import router from '@ohos.router'

class Item {
  name: string
  url: string

  constructor(name: string, url: string) {
    this.name = name
    this.url = url
  }
}


@Entry
@Component
struct SettingPage {

  private items: Array<Item> = [
    new Item("实验功能", "pages/Settings/ExperimentalFunction"),
    new Item("设备设置", "pages/Settings/DeviceSetting"),
    new Item("清扫记录", "pages/Settings/CleanRecord"),
    new Item("耗材计时", "pages/MainPage"),
    new Item("遥控器", "pages/Settings/RemoteControl"),
    new Item("设备名称", "pages/Settings/DeviceName"),
    new Item("位置管理", "pages/MainPage"),
    new Item("设备共享", "pages/MainPage"),
    new Item("智能场景", "pages/MainPage"),
    new Item("固件升级", "pages/MainPage"),
    new Item("更多设置", "pages/MainPage"),
    new Item("使用帮助", "pages/MainPage"),
    new Item("法律信息", "pages/MainPage"),
    new Item("异常信息管理", "pages/MainPage")
  ]

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
            url: "pages/MainPage"
          })
        })

        Text("设置")
          .width("80%")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
        Row() {
        }.width("10%")
      }.height("15%")

      List({ space: 8 }) {
        ForEach(
          this.items,
          (item: Item) => {
            ListItem() {
              Row() {
                Text(item.name)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
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
                    url: item.url
                  })
                })
              }
              .width("100%")
              .backgroundColor('#FFF')
              .borderRadius(20)
              .height(60)
              .padding(10)
            }
          }
        )
      }.width("100%")
      .layoutWeight(1)
    }.width('100%')
    .height('100%')

  }
}