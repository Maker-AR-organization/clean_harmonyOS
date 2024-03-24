import router from '@ohos.router'
@Entry
@Preview
@Component
struct LoadingPage {
  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center
    }) {
      Text("正在登录...")
        .fontSize(30)
        .fontColor(0x48D1CC)
        .fontWeight(FontWeight.Bold)
      LoadingProgress()
        .width("50%")
        .height("50%")
        .color(0x48D1CC)
    }.width("100%")
    .height("100%")
  }
  onPageShow() {
    setTimeout(() => {
      router.pushUrl({
        url: "pages/MainPage"
      })
    }, 3000)
  }
}