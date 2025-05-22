//
//  ContentView.swift
//  unitConversation.project1
//
//  Created by Ferid on 18.04.25.
//

import SwiftUI

struct ContentView: View {

    @State private var inputLength = 1.0
    @State private var inputLengthType = "meters"
    @State private var outputLengthType = "feet"
    

    let selectionOfInputLengthType = ["meters", "kilometers", "feet", "yard", "miles"]
    let selectionOfOutputLengthType = ["meters", "kilometers", "feet", "yard", "miles"]

    var convertToSmall: Double{
        switch inputLengthType {
        case "meters":
            inputLength * 3.28084
        case "kilometers":
            inputLength * 3280.84
        case "yard":
            inputLength * 3.0
        case "miles":
            inputLength * 5280.0
        default:
            inputLength
        }
    }

    var smallToReal: Double{
        switch outputLengthType {
        case "meters":
            convertToSmall * 0.3048
        case "kilometers":
            convertToSmall * 0.0003048
        case "yard":
            convertToSmall / 3.0
        case "miles":
            convertToSmall / 5280.0
        default:
            convertToSmall
        }
    }

    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Chose length to convert", selection: $inputLengthType){
                        ForEach(selectionOfInputLengthType , id: \.self ){
                            Text($0)
                            
                        }
                    }.pickerStyle(.segmented)
                    HStack{
                        TextField("1.0", value: $inputLength,
                                  format: .number)
                        Button("Convert"){

                        }.buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                    }
                }
                Section{
                    Picker("Chose length to convert", selection: $outputLengthType){
                        ForEach(selectionOfOutputLengthType , id: \.self ){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    Text(smallToReal.formatted())

                }
            }.navigationTitle("Converter")
        }
    }


}

#Preview {
    ContentView()
}
