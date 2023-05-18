//
//  ContentView.swift
//  WebSplitApp
//
//  Created by Jostin on 24/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkamt=0
    @State private var numppl=2
    @State private var tip=0
    @FocusState private var amountf:Bool
    let tiparray=[0,10,15,20,25]
    
    var checktip : Double{
    let nosplit=Double(tip+checkamt)
        
        return nosplit
    }
    
    var totalvalue : Double{
        let people=numppl + 2;
        let tipvalue=tip*checkamt/100
        let amount=tipvalue + checkamt
        let perperson=Double(amount/people)
        
        return perperson
    }
    
    var body: some View {
        NavigationView{        VStack{
            Form{
                Section{
                    Text("Check Amount")
                    TextField("Amount", value:$checkamt,format:.currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad)
                }.focused($amountf)
                Section{
                    Picker("Number of people", selection:$numppl){
                        ForEach (2..<100){
                            Text("\($0) People")
                        }
                    }
                }
                //picker section
                Section{
                    Picker("Tip Percentage", selection: $tip){
                        ForEach(tiparray, id: \.self){
                            Text($0, format:.percent )
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("How much do you like to Tip?")
                }
            
                //No split
                Section{
                    Text(checktip,format:.currency(code:Locale.current.currencyCode ?? "USD"))
                    
                }header:{
                    Text("Total amount with Tip:")
                }
                //Total value
                Section{
                    Text(totalvalue, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header:{
                    Text("Amount per person:")
                }
            }
            .navigationTitle("We Split")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountf=false
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
