//
//  home.swift
//  WORKX
//
//  Created by 吴子桐 on 16/9/2021.
//

import SwiftUI

//如果为ture表示用户正在点击已经存在的项目,如果为false表示用户点击了添加按钮
var editingMode: Bool = false
//用户正在编辑的项目是什么(备份用)
var editingtodo: Todo = emptyTodo
//用户正在编辑的项目是列表里的第几个
var editingIndex: Int = 0
//用户是否要更新项目(提示给系统)
var detailsShouldUpdateTitle : Bool = false

class Main: ObservableObject{
    //@Published的作用为:当属性发生更改时,实时更新页面
    @Published var todos:[Todo] = []
    //是否显示提示弹窗
    @Published var detailsShowing: Bool = false
    //显示的提示弹窗的标题内容
    @Published var detailsTiele: String = ""
    //
    @Published var deteilsDueDate: Date = Date()
    
    func sotr(){ //用于排序列表
        self.todos.sort(by: { $0.DueDate.timeIntervalSince1970 < $1.DueDate.timeIntervalSince1970})//让列表按时间顺序排序
        for i in 0 ..< self.todos.count{//遍历排序
            self.todos[i].i = i
        }
    }
    
    
}

struct home: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
