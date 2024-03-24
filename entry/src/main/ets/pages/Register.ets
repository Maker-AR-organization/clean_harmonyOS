import router from '@ohos.router'
import http from '@ohos.net.http';

@Entry
@Preview
@Component
struct Register {
  @State username: string = ''
  @State password: string = ''
  @State repassword: string = ''
  @State code: string = ''

  register() {
    // 每一个httpRequest对应一个HTTP请求任务，不可复用
    let jsondata;
    let httpRequest = http.createHttp();
    let url = 'http://127.0.0.1:8000/api/app/user/register/'
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
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + JSON.stringify(data.result));
        console.info('code:' + JSON.stringify(data.responseCode));
        if (data.responseCode == 200) {
          AlertDialog.show(
            {
              title: "注册",
              message: "注册账号成功，请登录",
              confirm: {
                value: 'OK',
                action: () => {
                  router.pushUrl({
                    url: "pages/Login"
                  })
                  router.push({
                    url: 'pages/Login'
                  })
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            }
          )
        }
        if (data.responseCode == 500) {
          AlertDialog.show(
            {
              title: '警告',
              message: '网络连接问题，请检查网络连接设置',
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
        if (data.responseCode == 404) {
          AlertDialog.show(
            {
              title: '警告',
              message: '账号已经存在',
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
      Button({ type: ButtonType.Normal }) {
        Image($r("app.media.back"))
      }
      .width("10%")
      .height(50)
      .backgroundColor(Color.White)
      .margin({
        right: 270,
        top: 20
      })
      .onClick(() => {
        router.pushUrl({
          url: "pages/Login"
        })
      })

      Row({ space: 10 }) {
        Text("手机号    ")
        TextInput({
          placeholder: "请输入手机号"
        })
          .width("70%")
          .height(40)
          .backgroundColor(Color.White)
          .borderRadius(5)
          .onChange((value: string) => {
            this.username = value
          })
      }.justifyContent(FlexAlign.Center)
      .margin({
        top: 100
      })

      Row({ space: 10 }) {
        Text("密 码      ")
        TextInput({
          placeholder: "请输入密码"
        })
          .width("70%")
          .height(40)
          .backgroundColor(Color.White)
          .borderRadius(5)
          .type(InputType.Password)
          .onChange((value: string) => {
            this.password = value
          })
      }.margin({
        top: 20
      })

      Row({ space: 10 }) {
        Text("确认密码")
        TextInput({
          placeholder: "请再次输入密码"
        })
          .width("70%")
          .height(40)
          .backgroundColor(Color.White)
          .borderRadius(5)
          .type(InputType.Password)
          .onChange((value: string) => {
            this.repassword = value
          })
      }.margin({
        top: 20
      })

      Row({ space: 10 }) {
        Text("  验 证 码")
        TextInput({
          placeholder: "  请输入验证码"
        })
          .width("40%")
          .height(40)
          .backgroundColor(Color.White)
          .borderRadius(5)
          .onChange((value: string) => {
            this.code = value
          })
        Button("获取验证码")
          .backgroundColor(0x48D1CC)
      }.margin({
        top: 20
      })

      Button("注册")
        .width("80%")
        .height(40)
        .backgroundColor(0x48D1CC)
        .margin({
          top: 120,
          bottom: 10
        })
        .onClick(() => {
          if (!this.username || !this.password || !this.repassword || !this.code) {
            AlertDialog.show(
              {
                title: '警告',
                message: '请输入完整信息',
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
            if (this.password == this.repassword) {
              this.register()

            } else {
              AlertDialog.show(
                {
                  title: '警告',
                  message: '密码输入不一致，请重新输入',
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
          }
        })
    }.width('100%')
    .height("100%")
  }
}