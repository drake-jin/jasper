---
layout: post
cover: 'assets/images/post/tags/react.png'
title: (스터디) React에 대해 알아보자 - 2
date: 2017-05-28
tags: react
subclass: 'post tag-react'
categories: 'drakejin'
navigation: True
---
모든 지적 재산권은 velopert 님에게 있습니다. velopert님께 감사합니다. 

## 2강. 설치

1. Globalpackage 설치
  1. babel - 아직 ECMAScript6 를 지원하지 않는 환경에서 ECMAScript6 Syntax를 사용 할 수 있게 해줍니다.
  2. webpack - 모듈 번들러로서, Browserify 처럼 브라우저 위에서 import (require) 을 할 수 있게 해주고 자바스크립트 파일들을 하나로 합쳐줍니다.
  3. webpack-dev-server - wepback에서 지원하는 간단한 개발서버로서 별도의 서버를 구축하지 않고도 웹서버를 열 수 있으며 hot-loader를 통하여 코드가 수정될때마다 자동으로 리로드 되게 할 수 있습니다.
  
``` bash
$ npm install -g babel webpack webpack-dev-server
```

2. 프로젝트 생성

``` bash
$ mkdir react-tutorial && cd react-tutorial
$ npm init
```

3. Dependency 및 Plugin 설치
 - 우리가 React 를 사용 할 것이므로, 설치해야줘야합니다. –save 옵션을 통하여 package.json 에 의존 패키지들을 추가 할 수있습니다.

``` bash
$ npm install --save react react-dom
```
 - babel 에서 사용 될 플러그인을 설치해야합니다. 해당 모듈들은 개발환경에서만 사용되므로 –save-dev 옵션을 설정해주세요.

``` bash 
$ npm install --save-dev babel-core babel-loader babel-preset-react babel-preset-es2015 webpack webpack-dev-server
``` 
 - webpack 과 webpack-dev-server 가 글로벌로 이미 설치가 되어있는데, 로컬 모듈로 설치된 이유는 webpack 의 livereload와 비슷한 기능인 –hot 옵션을 사용하기 위함 입니다. 
 - 사실 상, webpack 모듈을 글로벌 패키지로서 꼭 설치 할 필요는 없습니다. 이를 설치 한 이유는 커맨드라인에서 webpack-dev-server을 바로 실행하기 위함인데
 - 로컬에만 설치하고 나중에 webpack 을 실행할 때는 ./node_modules/bin/webpack-dev-server –hot 이런식으로 실행 할 수 있습니다.

 _RESULT:_
 ``` json
"dependencies": {
    "react": "^0.14.7",
    "react-dom": "^0.14.7"  
}, 
    "devDependencies": {
    "babel-core": "^6.7.0",
    "babel-loader": "^6.2.4",
    "babel-preset-es2015": "^6.6.0",
    "babel-preset-react": "^6.5.0",
    "webpack": "^1.12.14",
    "webpack-dev-server": "^1.14.1"
}
 ```

4. 디렉토기 구조 이해 및 파일 생성

```
$ mkdir src src/components public && touch public/index.html src/components/App.js src/index.js webpack.config.js
```

_RESULT :_

> react-tutorial
> ├── package.json         
> ├── public            # 서버 public path
> │   └── index.html    # 메인 페이지
> ├── src               # React.js 프로젝트 루트
> │   ├── components    # 컴포넌트 폴더
> │   │   └── App.js    # App 컴포넌트
> │   └── index.js      # Webpack Entry point
> └── webpack.config.js # Webpack 설정파일

5. 컴파일러, 서버 및 로더 설정 
webpack 설정하기 [ webpack.config.js ] ]
ECMAScript6 를 컴파일해주고 개발서버를 열어주는 webpack의 설정파일 webpack config.js 을 수정하세요.

``` bash 
module.exports = {
    entry: './src/index.js',

    output: {
        path: __dirname + '/public/',
        filename: 'bundle.js'
    },

    devServer: {
        inline: true,
        port: 7777,
        contentBase: __dirname + '/public/'
    },

    module: {
            loaders: [
                {
                    test: /\.js$/,
                    loader: 'babel-loader',
                    exclude: /node_modules/,
                    query: {
                        cacheDirectory: true,
                        presets: ['es2015', 'react']
                    }
                }
            ]
        }
};

```

6. webpack 실행 
npm start 명령어를 콘솔에서 입력 했을 때, webpack-dev-server 가 실핼될 수 있게 package.json 의 "script 항목을 수정합니다."

``` json 
"script":{
    "start" :"webpack-dev-server --hot --host 0.0.0.0"
}
// 만약 localhost 가 아닌 외부 서버에서 dev-server실행시, -host 옵션을 추가하지 않으면 접근이 안됩니다.
// localhost 인 경우에는 생략하면 됩니다.
```    

7. html 및 js 수정 
index.html 
이 파일은 평범한HTML 파일 입니다. div id = "app"을 react 프로젝트의 root element로 지정하고 
index.js 스크립트를 로드해주세요. 이 파일은 webpack 에서 bundle된 파일로써, react 라이브러리 
및 기타 자바스크립트 파일들이 하나로 합쳐진 파일입니다.

``` html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title> React App </title>
    </head>
    
    <body>
        <div id="root"></div>
        <script src="bundle.js"></script>
    </body>
</html>
```

8. src/components/App.js
우리가 만들 첫 React컴포넌트 입니다. 파일 및 컴포넌트의 첫 대문자로 입력하는건 React 의 naming
convention이다. 


``` js
import React from 'react';
// let React = require('react')

class App extends React.Components{
    render(){
        return (
            <h1> Hello drakejin!!? </h1>
        )
    }
    
}
export default App;
// == module.export = App
```

9. src/index.js 

``` js
import React from 'react'
import ReactDOM from 'react-dom'
import App from './components/App'

const rootElement = document.getElementById('root')
ReactDOM.render(<App />, rootElement);


```

10. 실행하기 

``` bash
$ npm start  // package.json 의 내용중 scripts의 내용에 start를 참조한다.
```


