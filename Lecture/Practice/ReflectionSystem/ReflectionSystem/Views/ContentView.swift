
import SwiftUI

// 메인 화면 회고 목록

struct ContentView: View {
    @StateObject var system: ReflectionViewModel
    
    var body: some View {
        NavigationStack(root: {
            List{
                ForEach(system.reflections){ reflection in
                    NavigationLink(destination: {
                        ReflectionDetailView(reflection: reflection)
                    }, label: {
                        VStack(alignment: .leading) {
                            Text(AppConstant.dateFormatter.string(from: reflection.date))
                            Text(reflection.content)
                                .lineLimit(1)
                                .foregroundStyle(Color.gray)
                        }
                        
                    })
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("회고 목록")
            .toolbar(content: {
                NavigationLink(destination: ReflectionView().environmentObject(system),label: {
                    Image(systemName: "square.and.pencil").padding()
                })
            })
        })
        .onAppear(perform: {
            system.reflectionsLoad()
        })
    }
    func removeRows(at offsets: IndexSet) {
    }
}

#Preview {
    let system = ReflectionViewModel()
    ContentView(system: system)
}
