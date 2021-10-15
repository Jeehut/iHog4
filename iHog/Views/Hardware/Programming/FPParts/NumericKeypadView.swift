//
//  NumericKeypadView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct NumericKeypadView: View {
    @EnvironmentObject var osc: OSCHelper
    
    var body: some View {
        VStack{
            HStack{
                Button("<-"){
                    print("Backspace")
                }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    .pressActions {
                        print("Pressed")
                        pushButton(buttonFunction: .backspace)
                    } onRelease: {
                        print("Releasing")
                    }
                Button("/"){
                    print("Slash")
                }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    .pressActions {
                        print("Pressed")
                        pushButton(buttonFunction: .slash)
                    } onRelease: {
                        print("Releasing")
                    }
                Button("-"){
                    print("Minus")
                }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    .pressActions {
                        print("Pressed")
                        pushButton(buttonFunction: .minus)
                    } onRelease: {
                        print("Releasing")
                    }
                Button("+"){
                    print("plus")
                }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    .pressActions {
                        print("Pressed")
                        pushButton(buttonFunction: .plus)
                    } onRelease: {
                        print("Releasing")
                    }
            }
            HStack{
                Button("7"){print(7)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "7")
                } onRelease: {
                    releaseButton(number: "7")
                }
                
                Button("8"){print(8)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "8")
                } onRelease: {
                    releaseButton(number: "8")
                }
                Button("9"){print(9)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "9")
                } onRelease: {
                    releaseButton(number: "9")
                }
                Button("thru"){print("thru")}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(buttonFunction: .thru)
                } onRelease: {
                    releaseButton(buttonFunction: .thru)
                }
            }
            HStack{
                Button("4"){print(4)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "4")
                } onRelease: {
                    releaseButton(number: "4")
                }
                
                Button("5"){print(5)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "5")
                } onRelease: {
                    releaseButton(number: "5")
                }
                Button("6"){print(6)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "6")
                } onRelease: {
                    releaseButton(number: "6")
                }
                Button("full"){print("full")}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(buttonFunction: .full)
                } onRelease: {
                    releaseButton(buttonFunction: .full)
                }
            }
            HStack{
                Button("1"){print(1)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "1")
                } onRelease: {
                    releaseButton(number: "1")
                }
                
                Button("2"){print(2)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "2")
                } onRelease: {
                    releaseButton(number: "2")
                }
                Button("3"){print(3)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "3")
                } onRelease: {
                    releaseButton(number: "3")
                }
                Button("@"){print("@")}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(buttonFunction: .at)
                } onRelease: {
                    releaseButton(buttonFunction: .at)
                }
            }
            HStack{
                Button("0"){print(0)}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(number: "0")
                } onRelease: {
                    releaseButton(number: "0")
                }
                
                Button("."){print(".")}
                .buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                .pressActions {
                    pushButton(buttonFunction: .period)
                } onRelease: {
                    releaseButton(buttonFunction: .period)
                }
                Button("Enter"){print("Enter")}
                .buttonStyle(FrontPanelButton(width: L_BUTTON_WIDTH, backgroundColor: .gray))
                .pressActions {
                    pushButton(buttonFunction: .enter)
                } onRelease: {
                    releaseButton(buttonFunction: .enter)
                }
            }
        }
    }
    
    // MARK: Used for all buttons not a number key
    func pushButton(buttonFunction: ButtonFunctionNames){
        osc.pushFrontPanelButton(button: buttonFunction.rawValue)
    }
    
    // MARK: Only used for number keys
    func pushButton(number: String){
        osc.pushFrontPanelButton(button: number)
    }
    
    // MARK: RELEASE BUTTONS
    
    func releaseButton(buttonFunction: ButtonFunctionNames){
        osc.releaseFrontPanelButton(button: buttonFunction.rawValue)
    }
    
    // MARK: Only used for number keys
    func releaseButton(number: String){
        osc.releaseFrontPanelButton(button: number)
    }
}

struct NumericKeypadView_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeypadView()
    }
}
