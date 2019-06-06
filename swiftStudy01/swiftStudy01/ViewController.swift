//
//  ViewController.swift
//  swiftStudy01
//
//  Created by 刘恋 on 2019/6/4.
//  Copyright © 2019 刘恋. All rights reserved.
//

import UIKit

//let 修饰不可变量  var修饰可变量
var a = 10
var b = 2
let c = a + b

//可以不用指定变量类型 编译器会自动识别
var aStr = "hello"
var bStr:String = "hello"

//声明数组  不局限数据类型
var arr = ["hello","你好",1,2.4] as [Any]
//声明数组  不局限数据类型  空数组
var arr1 = [] as [Any]
//声明数组  限字符串类型
var arr2 = [String]()

//字典
var dict = ["name":"liulian","age":"18"]

//循环
var arrDemo = [String]()

//面向对象
class Hi{
    func sanHi(){
        print("面向对象")
    }
}
//继承 Hi
class hello:Hi{
    
    var _name:String
    init(name:String) {
        self._name = name
    }
    
    override func sanHi() {
        print("重写父类方法  需要用到override 关键字 \(self._name)")
    }
    
//    init() {
//        print("构造方法")
//    }
//
//    override func sanHi() {
//        print("重写父类方法  需要用到override 关键字")
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        //变量 不可变量
//        print(c)
//        print(a+b)
//        print(aStr,bStr)
//
//        //字符串
//        //使用以下这种方式可以直接实现字符串拼接
//        aStr = aStr + "拼接"
//        aStr = "\(aStr),开始拼接整形了,\(100)"
//        print("拼接字符串====",aStr);
//
//
//        //数组
//        arr.insert(3.0, at: 0)//不限类型
//        arr1.insert(2.0, at: 0)
//        arr1.insert("文字", at: 1)
//        print("数组=======",arr,arr1,arr2.count);
//        arr2 .insert("23443453", at: 0)
//        print("数组增加后=====",arr2);
//        arr.remove(at: 1)
//        print("数组删除后======",arr)
//
//        //字典
//        print("字典=======",dict)
//        dict["sex"] = "Female"//这种方式可以直接添加进去
//        print(dict,dict["name"] as Any)// dict["name"]  直接用
//        dict.removeValue(forKey: "sex")//进行删除
//        print("删除字典后======",dict)
        
        
        //循环
//        for index in 0...5 {
//            arrDemo.append("Item \(index)")
//        }
//        print("循环数组====",arrDemo)
//
//        for value in arrDemo {
//            print("第二种方式",value)
//        }
//
//        var index = 0
//        while index < arrDemo.count {
//            print("while循环",arrDemo[index])
//            index+=1;
//        }
//        for (key,value) in dict {
//            print("遍历字典中的值======   \(key),\(value)")
//        }
        
        
        //流程控制
//        for index in 0...10 {
//            if index%2 == 0{
//                print("偶数  ",index)
//            }
//        }
//
//        //这里? 意味着是可选变量
//        let myName:String?="我是字符串"
//        if let  name = myName { //如果是ture 则执行
//            print("hello \(name)")
//        }
        
        
        //函数
//        sayHello(name: "你好")//调用函数
//        let a = getNums()//返回一个值
//        print("函数返回值",a)
//        let (c,d) = getNums2()//返回多个值
//        print("函数返回值",c,d)
//        let (e,f) = getNums3()//返回多个值  不同类型的值
//        print("函数返回值",e,f)
//
//        let  fun = sayHello //传递函数  给 fun
//        fun("zhangsan")
        
        

//        //面向对象
//        let hi = Hi()
//        hi.sanHi()
//        
////        let h = hello()
////        h.sanHi()
//        
//        let h = hello(name: "zhangsan")
//        h.sanHi()
        
    }


    func sayHello( name:String){
        print("hello \(name)")
    }
    
    func getNums() -> Int {
        return (2)
    }
    func getNums2() -> (Int,Int) {
        return (2,3)
    }
    func getNums3() -> (Int,String) {
        return (2,"你好")
    }
}

