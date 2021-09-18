//
//  ContentView.swift
//  WORKX
//
//  Created by 吴子桐 on 16/9/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack (alignment: .bottomTrailing){
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                             .frame(width: 700, height: 70)
                             .background(Color.blue)
                             .clipShape(Circle())
                            .offset(x: UIScreen.main.bounds.width/2 - 60, y: UIScreen.main.bounds.height/2 - 80)
                            .animation(.spring())
        }
        
        }
        
    
    }


class Todo: NSObject,NSCoding{
    //持久化存储(自动压缩)
    func encode(with coder: NSCoder) {
        //forkey为存储到词典的词
        coder.encode(self.title,forKey: "title")
        coder.encode(self.DueDate,forKey: "DueDate")
        coder.encode(self.checked,forKey: "checked")
    }
    //持久化存储(自动解压)
    required init?(coder: NSCoder) {
        //从词典读取并载入为特定类型,如果为假(词典中没有)则转为空的特定类型
        self.title = coder.decodeObject(forKey: "title") as? String ?? ""
        self.DueDate = coder.decodeObject(forKey: "Duedate") as? Date ?? Date()
        self.checked = coder.decodeBool(forKey: "checked")
    }
    
    //todo列表属性
    
    var title : String = "" //列表标题
    var DueDate : Date = Date() //截止日期
    var checked : Bool = false  //是否完成
    var i : Int = 0 //排序顺序
    
    init(title : String, DueDate : Date) {
        self.title = title
        self.DueDate = DueDate
    }
    
}

var emptyTodo : Todo = Todo(title: "", DueDate: Date())
struct TodoItem: View{
    @ObservedObject var main: Main
    @Binding var todoIndex:Int
    @State var checked: Bool = false
    var body: some View{
        HStack{
            Button(action: {
                editingMode = true
                editingtodo = self.main.todos[self.todoIndex]
                editingIndex = self.todoIndex
                self.main.detailsTiele = editingtodo.title
                self.main.deteilsDueDate = editingtodo.DueDate
                self.main.detailsShowing = true
                detailsShouldUpdateTitle = true
                
            }){
                HStack{
                    VStack{
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 8)
                    }
                    Spacer()
                        .frame(width:10)
                    VStack{
                        Spacer()
                            .frame(height:12)
                        HStack{
                            Text(main.todos[todoIndex].title)
                                .font(.headline)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Spacer()
                                .frame(height:4)
                            HStack{
                                Image(systemName: "clock")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                  }
                           
                            }
                        }
                        
                    }
                }
            }
        }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
