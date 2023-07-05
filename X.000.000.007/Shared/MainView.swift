//
//  ContentView.swift
//  Shared
//
//  Created by Develop on 19.03.22.
//

import SwiftUI

struct MainView: View {
    @State private var calculation = Calculation()
    @State private var newThingName = ""
    @State private var minNumbersValue = ""
    @State private var maxNumbersValue = ""
    @State private var countValue = ""
    @State private var pickedValue = ""
    
    var body: some View {
        
        List {
            Section(header: Text("Pick Random")) {
                Toggle("Delete object after pick", isOn: $calculation.deleteAfter)
                if 0 < calculation.list.count && calculation.list.count <= 200 {
                    Button(action: {
                        pickedValue = calculation.picker()
                        hideKeyboard()
                    }) {
                        Text("Pick random")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                
                } else if calculation.list.count > 200 {
                    Text("There are to many objects (Max. 200)")
                } else {
                    Text("You need to add objects bellow")
                }
                if pickedValue != "" {
                    HStack {
                        Text(pickedValue)
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                pickedValue = ""
                                hideKeyboard()
                            }
                        }) {
                            Image(systemName: "minus.circle.fill")
                        }
                    }
                    
                }
                
            }
                
            Section(header: Text("Quick functions")) {
                Button(action: {
                    withAnimation {
                        calculation.delete()
                        hideKeyboard()
                    }
                }) {
                    Text("Delete all")
                        .font(.headline)
                        .foregroundColor(.red)
                }
                HStack {
                    Text("Add alphabet")
                    Spacer()
                    Button(action: {
                        withAnimation {
                            calculation.alphabet()
                            hideKeyboard()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                HStack {
                    Text("Add Yes and No")
                    Spacer()
                    Button(action: {
                        withAnimation {
                            calculation.yesOrNo()
                            hideKeyboard()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                HStack {
                    Text("Add a row of numbers")
                    Spacer()
                    Button(action: {
                        withAnimation {
                            calculation.numbers(start: minNumbersValue, end: maxNumbersValue, count: countValue)
                            minNumbersValue = ""
                            maxNumbersValue = ""
                            countValue = ""
                            hideKeyboard()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(minNumbersValue.isEmpty || maxNumbersValue.isEmpty || countValue.isEmpty)
                }
                TextField("Mininmal number", text: $minNumbersValue)
                    .keyboardType(.numberPad)
                TextField("Maximal number", text: $maxNumbersValue)
                    .keyboardType(.numberPad)
                TextField("Count", text: $countValue)
                    .keyboardType(.numberPad)
                
            }
            
            Section(header: Text("Objects")) {
                HStack {
                    TextField("New object", text: $newThingName)
                    Button(action: {
                        withAnimation {
                            calculation.addValue(newThingName)
                            newThingName = ""
                            hideKeyboard()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newThingName.isEmpty)
                }
                ForEach(calculation.list) { value in
                    Text(value.thing)
                }
                .onDelete { indices in
                    calculation.list.remove(atOffsets: indices)
                }
                
            }
        }
        .navigationTitle("Your Picker")
        .alert(isPresented: $calculation.showAlert) {
            Alert(title: Text("Could not add everything, because the max amount is 200"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
