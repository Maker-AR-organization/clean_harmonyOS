import router from '@ohos.router'
import http from '@ohos.net.http'

@Entry
@Preview
@Component
struct Login {
  @State username: string = ''
  @State password: string = ''
  @State datastr: string = ''

  login() {
    // 每一个httpRequest对应一个HTTP请求任务，不可复用
    let jsondata;
    let httpRequest = http.createHttp();
    let url = 'http://127.0.0.1:8000/api/app/user/login/'
    // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      url,
      {
        method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        // 当使用POST请求时此字段用于传递内容
        extraData: {
          "username": this.username,
          "password": this.password
        },
      }, (err, data) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        jsondata = data.result
        jsondata = JSON.parse(jsondata)
        this.datastr = jsondata.datastr
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + JSON.stringify(data.result));
        console.info('code:' + JSON.stringify(data.responseCode));
        if (data.responseCode == 200) {
          router.push({
            url: 'pages/LoadingPage'
          })
        }
        if (data.responseCode == 404) {
          AlertDialog.show(
            {
              title: '警告',
              message: '账号不存在，请完成注册',
              primaryButton: {
                value: 'OK',
                action: () => {
                  console.info('Callback when the first button is clicked')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            }
          )
        }
        if (data.responseCode == 401) {
          AlertDialog.show(
            {
              title: '警告',
              message: '密码错误，请重新输入密码',
              primaryButton: {
                value: 'OK',
                action: () => {
                  console.info('Callback when the first button is clicked')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            }
          )
        }
      } else {
        console.info('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁。
        httpRequest.destroy();
      }
    }
    );
  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.clean"))
          .width(100)
          .height(100)
          .margin({
            top: 10,
            left: 135
          })
      }.width("100%")
      .height(200)
      .backgroundColor(0x48D1CC)
      .margin({
        bottom: 30
      })
      Text("扫地机器人")
        .fontSize("30")
        .margin({
          bottom: 30
        })
      //手机号输入框
      TextInput({
        placeholder: "请输入手机号"
      })
        .width("80%")
        .height(40)
        .backgroundColor(Color.White)
        .borderRadius(5)
        .margin({
          bottom: 30
        })
        .onChange((value: string) => {
          this.username = value
        })
      //密码输入框
      TextInput({
        placeholder: "请输入密码"
      })
        .width("80%")
        .height(40)
        .backgroundColor(Color.White)
        .borderRadius(5)
        .type(InputType.Password)
        .margin({
          bottom: 10
        })
        .onChange((value: string) => {
          this.password = value
        }
        )
      Row({ space: 70 }) {
        //忘记密码？
        Text("忘记密码?")
          .fontSize(14)
        //没有账号？注册
        Row({ space: 5 }) {
          Text("没有账号？")
            .fontSize(14)
          Text("注册")
            .fontSize(14)
            .fontColor(0x48D1CC)
            .onClick(() => {
              router.pushUrl({
                url: "pages/Register"
              })
            })
        }
      }.margin({
        top: 10
      })
      .justifyContent(FlexAlign.Center)
      //登录
      Button("登录")
        .width("80%")
        .height(40)
        .backgroundColor(0x48D1CC)
        .margin({
          top: 40,
          bottom: 10
        })
        .onClick(() => {
          router.pushUrl({
            url:"pages/LoadingPage"
          })
          if (!this.username || !this.password) {
            AlertDialog.show(
              {
                title: '警告',
                message: '账号或者密码为空',
                primaryButton: {
                  value: 'OK',
                  action: () => {
                    console.info('Callback when the first button is clicked')
                  }
                },
                cancel: () => {
                  console.info('Closed callbacks')
                }
              }
            )
          } else {
            this.login()
          }
        })
      //隐私协议
      Row({ space: 5 }) {
        Checkbox()
        Text("请勾选隐私协议")
      }.margin({
        bottom: 40
      })
      //其他登录方式
      Text("其他登录方式")
        .margin({
          bottom: 30
        })
      //图片
      Image($r("app.media.wechat"))
        .width(30)
        .height(30)
    }.width("100%")
    .height("100%")
  }
}