---
layout: post
cover: 'assets/images/post/tags/go.png'
title: (스터디) Go 언어를.araboza - Intro
date: 2017-05-20 02:58:00
tags: go
subclass: 'post tag-go'
categories: 'drakejin'
navigation: True
---

## 이 언어를 시작하게 된 동기
Retrica 면접을 보는대 Retrica 서버는 Go 언어와 ProtoBuf를 활용한 서버를 사용중이었다. 
면접 질문중에서 .. 

> 면접관 질문 : 용진씨가 해본 언어 Java, Javascript, Python 위 셋 중에 어떤언어가 
철학적으로 마음에 들며, 어떤 언어를 배우고 싶으신가요?
 
 사실 Retrica에 들어가기 전부터 Go와 Erlang를 배우고 싶어했었다. 하지만, 취업을 해야하는 입장에서
뭐가 하고 싶다 하더라도 쉽게 도전할 깡다구가 생기지 않는다. 영어하랴, 자소서쓰랴 등등.. 
여러가지 요인이 날 방해하고있었기 때문이다. 답변은 속 시원하게 말아먹었었다. 

> 내 답변 : "철학으로는 Javascript고 배우고 싶은 언어는 Go와 Erlang입니다. 
> Javascript의 ... (나도 정확히 모르는 내용을 예시를 들려고해서 아예 이 답변을 말아먹었다. ) 
> 그리고 Go 와 Erlang 은 배우고 싶은대 그 이유는 분산처리에 탁월하다는 능력을 들었었습니다. 
> 직접 해본적은 없지만 만약 배운다면 Go또는 Erlang을 배우고 싶었습니다. 
> Erlang은 네이버 라인에서 사용하고 있는 언어로 동접자가 기하급수로 불어난 서비스에 어떻게 해서 
> Erlang으로 구축할 생각을 했었는지 어떤 의사결정을 통해 Erlang을 선택했는지 궁금했습니다..(생략)"

아직 결과는 나오지 않았지만 분명 탈락일것이다. 
내가 면접관이라도 모르는 내용으로 답변하려 들면 기분좋게 탈락시켰을 태니 말이다.

> 즉, 지금은 이 언어를 시작하게 된 동기는 원래 배우고 싶었지만 결정적인 원인은
실제로 해보고 싶었으면서 면접에서 탈탈 털린 내 자신에게 한탄하기위해 시작한다.

-----------------
Retrica에서 면접보러온사람이 서버개발자 팀장급과 Retrica 를 처음 만든 창업자 장본인(CEO)이 와서
면접을 보았다. 난 이것에 탈락되어도 후회하지않는다. ( 아쉽긴 하지만 ) 심지어 싸인도 받아보고 싶다. 


## 설치
 Go Compiler는 공식 웹페이지 에서 다운 받을 수 있다.  버전은 1.8.1

1. 플랫폼별 인스톨 파일 
  - [Linux 다운로드](https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz)
  - [MacOS 다운로드](https://storage.googleapis.com/golang/go1.8.1.darwin-amd64.pkg)
  - [Windows 다운로드](https://storage.googleapis.com/golang/go1.8.1.windows-amd64.msi)

2. 환경변수 및 PATH 설정 
 설치는 해당 페이지를 참고하였다. [참고](https://golang.org/doc/install?download=go1.8.1.linux-amd64.tar.gz) 
    ``` bash
$ sudo tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz 
$ vi ~/.zshrc
# ------------------------------------------------------
GO_HOME=/usr/local/go
#GO_HOME 을 지정해주는것은 일종의 작성자 습관과도 같은녀석.. 
GOPATH=$HOME/go 
#GOPATH는 작업경로 같은것... 사용자의 작업 공간 디렉토리에 GOPATH라는 환경설정을 셋팅해준다. 
PATH=$PATH:$GO_HOME/bin:$GOPATH/bin

export GO_HOME PATH GOPATH

# GOROOT 이거 안정해주면 go 컴파일러가 go 언어의 라이브러리를 어디에서 가져와야하는지 모른다 
# ------------------------------------------------------
    ```
3. Source 편집 

    ``` go 
$ vi {CUSTOM\_PROJECT\_HOME}/src/hello/hello.go  
----------------
package main 
import "fmt"

func main(){
    fmt.Printf("Hello world\n")
}
---------------
$ cd {CUSTOM\_PROJECT\_HOME}/src/hello
$ go build 

   ```
여기 과정까지 무사히 왔다면 설치는 완료 





