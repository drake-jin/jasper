---
layout: post
cover: 'assets/images/post/tags/react.png'
title: (스터디) React 를 알아보자 - 1
date: 2017-05-26
tags: react
subclass: 'post tag-react'
categories: 'drakejin'
navigation: True
---
React.js 으.. 남들 하니까 협업을 위해 한다 .
개인 정리를 위해 만들었으며 모든 지적 재산권은 https://velopert.com/775 에 있습니다. 

## React 강좌 01: 소개 및 맛보기

React느 페이스북에서 개발한 UI개발 라이브러리, Virtual DOM을 사용하여 금새 
재사용 가능한 UI를 생설할 수 있게 해준다. react는 페이스북, 인스타, 야후, 넷플리스
에서 사용하고 있고 최근은 스타트업의 프론트UI를 주름잡는 녀석이 되었다. 

## Virtual DOM

#### DOM 의 이해 
  DOM은 Document Object Model 의 야사. 이는 객체를 통하여 구조화된 문서를 표현하는 방법
XML 또는 HTML로 작성된다. 웹 브라우저는 DOM을 활용하여 객체에 Javascript와 CSS를 적용하고 있다. DOM은 트리형태로 되어있어서 수정, 삭제, 생성에 용이하다. 

#### DOM의 문제점 
 - 동적 UI(서버와 통신이 잦은 Web Service)에 최적화 되어있지 않다.
 - 큰 규모의 서비스에서는 수 많은 데이터가 웹으로 로드되어야 하며, 한 DOM객체에 대한것이 아닌 여러 객체에 대해서 CRUD가 이뤄진다. 


> 잘못알고 있는 상식 
> 1. DOM은 무겁다.
> 2. Javascript 접근이 DOM 직접 접근 보다 빠르다 
>   - 이는 사실이 아니며 DOM자체는 빠르다. 다만 브라우저 단에서 DOM의 변화가 일어나면 브라우저가 CSS를 다시 연산하고 레이아웃을 다시 구성하고, 웹페이지를 다시 리페인트 하는데, 이 과정에서 시간이 많이 허비되게 된다. 
>   - 레이아웃을 새로 구성하면서 계산하는것이 reflow
>   - 색상변경과 같은 레이아웃에 관계없는 것들을 처리하는것이 repaint

``` javascript
var style = document.body.style; // 캐싱 
style.padding = "20px" // reflow, repaint
style.border = "10px solid red" // reflow, repaint

style.color = "blue" // repaint
style.backgroundColor = "#ffa"  // repaint

style.fontSize = "1em"  // reflow, repaint

document.body.appendChild(document.createTextNode('hello world!'));
// reflow, repaint 

//----- d이것 이외에도 값을 조회만 할 때에도 reflow가 계산된다.
element.offsetLeft      // reflow
element.clientWidth     // reflow
element.getClientRects() // reflow
```

#### 브라우저는 바보가 아니다. 
위와 같이 언급한 부분에서는 별것 아닌 작업에도 reflow와 repaint작업이 발생하게됩니다. 
실제로 저런 작업이 실행되면 성능저하를 줄이기 위해 매우 짧은 시간내에 여러 reflow가 발생하려고 할 시 이 작업을 미루고 한꺼번에 처리합니다. 

> 단, 일부 코드들 offsetTop, scrollTop, getComputedStyle()등의 코드가 실행 될 때는 현재의 값을 가져오는것들이 중요하기 떄문에 reflow가 여러번 발생할 수 밖에 없게 된다.


#### Reflow와 Repaint 해결 
Virtual DOM을 이용하면 실제 DOM에 접근하여 조작하는 대신에, 이를 추상화 시킨 자바스크립트 객체를 구성하여 사용하면 됩니다.
 Virtual DOM은 실제 DOM의 가벼운 사본과 같은 역할을 합니다 .

1. DOM에 대한 데이터 업데이트가 되면, 전체 UI를 Virtual DOM 에 렌더링 합니다.
2. 이전 Virtual DOM에 있던 내용과 현재의 내용을 비교합니다.
3. 바뀐 부분에만 실제 DOM에 적용 됩니다.

> 오해 
> "React는 항상 빨라!! 빠르다규!"
>
> React는 무조건 빠른게 아니다. 지속해서 데이터가 변화하는 대규모 애플리케이션에 구축하기 위해 
> React를 만들었다. 

## React 

### React 특징 
 - Virtual DOM을 사용한다. 
 - JSX : JSX는 javascript의 확장 문법으로써 babel이 이 확장문법을 파싱해주며, React.Component(asd,asd,asd,asd,asd,)의 형태로 변형해준다. 써도그만 안써도 그만, 안쓰면 불편할 뿐 
 - Components: React는 모두 Component에 대한 것, React 개발을 할 때에는 Component로써 생각해야 한다. 

### React의 장점 
 - Virtual DOM을 사용한 어플리케이션의 성능향상
 - 클라이언트에서 렌더링 될 수 있고 서버측에서도 렌더링 될 수 있음.
 - 브라우저측의 초기 렌더링 딜레이를 줄이고, SEO호환도 가능해진다. 
 - Component의 가독성이 매우 높고 간단하여 쉬운 유지보수가 가능해진다.
 - 프레임워크가 아닌 라이브러리이기 때문에 타 프레임워크와 혼합 사용이 가능하다.
 - React에선 UI만 신경쓰고 나머지 라우팅기능은 프레임워크..

### 제한
 - 어플리케이션의 View레이어만 다루므로 이 외의 부분은 다른 기술을 사용해야 한다. (Ajax, Router등등..)
 - React 버전 v15부터는 IE8 이하 버전을 지원하지 않는다. 

### 맛보기 
 - React프로젝트를 시작하려면 node.js와 NPM을 설정하고 이것저것 서정을 많이 해야한다 - React를 맛보기 위해 유용하고 편한 웹 서비스인 webpackbin을 사용해보겠다.

1. 상단 메뉴의 Boilerplated > React클릭 
2. index.html, main.js, HelloWorld.js파일이 생긴다. 

#### HelloWorld.js 

``` javascript
import React from 'react'

function HelloWorld(){
    return (
        <h1> Hello World !</h1>
    );
}

export default HelloWorld

```
소스코드 설명 

 1. 상단의 import는 ES6문법으로 사용되며 _var React = require('react')_ 는 동일한 의미이다. require는 Node.js의 것으로 클라이언트 사이드에선 보통 html태그를 이용하여 script를 여럿 불러오지만, require를 이용하지 않습니다. 지원도 하지 않고..
 2. Bundling webpack이라는 도구를 이용하여 Node.js에서 require하는것과 같이 모듈을 불러올 수 있께 하는 것. Webpack은 이렇게 import(혹은 require)한 모듈을 불러와서 한 파일로 합친다. 
 3. babel-loader는 

``` javascript 
    return React.createElement(<h1>Hello World!</h1>)
```
를 
``` javascript 
    return React.createElement(
        "h1",
        null,
        "Hello World!"
    );
```
로 변환시킨다. JSX => Javascript 

#### main.js 

``` javascript
import React from 'react';
import {render} from 'react-dom'
import HelloWorld from './HelloWorld.js'

render(<HelloWorld/>), document.querySelector("#app"));

```
main.js에서는 HelloWorld.js 에서 만든 컴포넌트를 불러와서 페이지에 렌더링 합니다.

이 파일은webpack의 entry파일 입니다. 여기서부터 import 하는 파일들을 재귀적으로 모두 불러와서 하나의 파일로 합치게 됩니다. 
React컴포넌트를 페이지에 렌더링 할 때에는 react-dom모듈을 불러와서 render함수를 통하여 처리합니다. 

여기서 render 함수의 첫 번째 파라미터는 렌더링 할 JSX 형태의 코드 입니다. 여기서는 HelloWorld컴포넌트를 렌더링 하도록 설정하였습니다. 
이런식으로 컴포넌트를 만들면 _<컴포넌트이름/>_이런식으로 HTML태그를 작성하듯이 쓸 수 있는것입니다.

두번째 파라메터는 렌더링할 HTML요소 입니다. id가 app인 DOM객체에 렌더링하게 설정했습니다.  이는 index.html에서 찾아볼 수 있습니다 .

#### index.html 

``` javascript
<html>
    <head>
        <meta charset="utf-8"/>
    </head>
    <body>
        <div id="app"></div>
        <script src="main.js"></script>
    </body> 
</html>

```

### 컴포넌트에 속성을 줘보자 .
HelloWorld컴포넌트에 속성을 만들어본다. 코드를 다음과 같이 수정해보자.

#### HelloWorld.js

``` javascript
import React from 'react';
function HelloWorld (props){
    return (
        <h1> Hello {props.name}!</h1>
    );
}

export default HelloWorld;
```

함수에 props 파라미터를 추가하고, 이 props.name값을 JSX안에서 렌더링 하도록 하였다. 
JavaScript값을 JSX에서 렌더링 할 때에는 {  }안에 감싸면 JSX가 알아서 값을 가져옵니다.

``` main.js 

import React from 'react';
import {render} from 'react-dom';
import HelloWorld from './HelloWorld.js'

render(<HelloWorld name="velopert" />, document.querySelector("#app"));
```









