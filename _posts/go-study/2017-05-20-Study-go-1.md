---
layout: post
cover: 'assets/images/post/tags/go.png'
title: (스터디) Go 언어를.arabojja - 1
date: 2017-05-20
tags: go
subclass: 'post tag-go'
categories: 'drakejin'
navigation: True
---
[데이터공작소] 일단 시작하기 앞서서 설치를 먼저 해봅시다. 

## 설치
 Go Compiler는 공식 웹페이지 에서 다운 받을 수 있다.  버전은 1.8.1

 1. 플랫폼별 인스톨 파일 
  - [Linux 다운로드](https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz)
  - [MacOS 다운로드](https://storage.googleapis.com/golang/go1.8.1.darwin-amd64.pkg)
  - [Windows 다운로드](https://storage.googleapis.com/golang/go1.8.1.windows-amd64.msi)

 2. 환경변수 및 PATH 설정[[참고페이지](https://golang.org/doc/install?download=go1.8.1.linux-amd64.tar.gz)]

  ``` sh

    $ sudo tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz 
    $ vi ~/.zshrc
    
    # ----------- vi ~/.zshrc -------------------------------
    GOROOT=/usr/local/go
    PATH=$PATH:$GO_HOME/bin:$GOROOT/bin

    export PATH GOROOT
    # ------------------------------------------------------
  ```

#### vi ~/.bashrc 파일 설정 

![vi .bashrc.sh](/assets/images/post/2017-05-20/bash.png)


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

#### vi ~/.bashrc 파일 설정 

![vi hello.go](/assets/images/post/2017-05-20/hello.go.png) 


#### 소스 실행 결과  

![result hello.go](/assets/images/post/2017-05-20/hello-result.png)

#### 설치된 Go 의 환경설정 확인 

![go env](/assets/images/post/2017-05-20/env.png)


여기 과정까지 무사히 왔다면 설치는 완료 


