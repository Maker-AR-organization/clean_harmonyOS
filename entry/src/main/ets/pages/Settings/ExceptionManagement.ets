// // 导入HarmonyOS的HTTP模块
// import http from '@ohos.net.http';
// import http from '@ohos.net.http';
// 导入第一个HarmonyOS的HTTP模块
import http1 from '@ohos.net.http';

// 导入第二个HarmonyOS的HTTP模块
import http2 from '@ohos.net.http';

// 定义一个HarmonyOS应用组件（页面）并使用装饰器@Entry标记为入口组件
@Entry
@Component
struct ExceptionManagement {
  // 使用@State装饰器声明两个状态变量，datastr用于存储从服务器获取的数据字符串形式，adc用于存储解析后的ADC值
  @State datastr: string = '原始数据';
  @State image: string = "";


  // 定义jsondata1方法，该方法发送POST请求至指定URL，不处理响应结果
  jsondata1() {
    // 请撰写代码
    const httpRequest = http1.createHttp();
    const url = 'http://127.0.0.1:8000/api/iotdata1/';
    httpRequest.request(
      url,
      { method: http1.RequestMethod.POST, header: { 'content-Type': 'application/json' } },
      (err) => {
        console.info('error:' + JSON.stringify(err));
        httpRequest.destroy();
      }
    );
  }

  // 定义一个名为jsondata的方法，用于向指定的HTTP API发送POST请求，并处理响应结果
  jsondata() {
    // 请撰写代码
    let jsondata;
    let httpRequest = http2.createHttp();
    let url = 'http://127.0.0.1:8000/api/app/box/';
    httpRequest.request(
      url,
      { method: http2.RequestMethod.POST, header: { 'content-Type': 'application/json' } },
      (err, data) => {
        if (data.responseCode == 200) {
          console.info('传递成功');
          console.info('传递参数${data.result}');
          jsondata = data.result;
          // this.datastr = JSON.stringify(data.result);

          this.image = jsondata
          console.info(this.image)
          // jsondata =JSON.stringify(jsondata);
          // this.adc = jsondata;
          // console.info(this.datastr)
        } else {
          console.info('error:' + JSON.stringify(err));
          httpRequest.destroy();
        }
      }

    );
  }


  // 定义组件的构建方法（build method），该方法负责生成和渲染组件的用户界面
  build() {
    // 使用Column组件创建一个垂直布局容器
    Column() {

      // 在主Column内嵌套一个子Column，并设置其内部元素间距为17单位
      Column({ space: 17 }) {

        // 创建一个按钮，用于触发数据获取操作
        Button('获取数据')
          .width(300) // 设置按钮宽度为300单位
          .height(60) // 设置按钮高度为60单位
          .fontSize(20) // 设置按钮文字大小为20单位
          .backgroundColor('#0F40F5') // 设置按钮背景色为深蓝色

            // 为按钮添加点击事件监听器，当按钮被点击时执行回调函数
          .onClick(() => {
            this.jsondata()
            //5秒后，调用jsondata方法
            // setTimeout(() => {
            //   this.jsondata()
            // }, 100)
          });

        // 创建一个水平布局容器Row，其中包含两个Text组件
        Row() {
          // 第二个Text组件用于动态显示变量adc的值（转换为字符串形式），同样设置字体大小为30单位并加粗字体
          Image(this.image)
            .width(200)
            .height(200)
        }.justifyContent(FlexAlign.SpaceBetween).width('40%')
        // 设置Row容器内部元素之间的间距方式为SpaceBetween，即子元素间均匀分配剩余空间
        // 并且设置该Row容器的宽度为其父容器宽度的40%

        // 在Row容器下方添加另一个独立的Text组件，用于显示变量datastr的内容，字体大小设置为30单位且加粗
        // Text(this.datastr)
        //   .fontSize(30)
        //   .fontWeight(FontWeight.Bold)
      }
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.SpaceAround)
    // 对于最外层的布局容器，设置其宽度和高度均为其父容器的100%，确保完全填充可用空间
    // 同时设置内容的对齐方式为SpaceAround，使得容器内所有元素在垂直方向上均匀间隔分布
  }
}
