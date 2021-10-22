//
//  RegCompFPProgrammer.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct RegCompFPProgramming: View {
    @EnvironmentObject var osc: OSCHelper
    
    @State private var isEncoderShown: Bool = false
    @State private var isActionShown: Bool = false
    @State private var isFunctionShown: Bool = false
    
    let buttonSize: CGFloat = BASE_BUTTON_SIZE
    
    var body: some View {
        HStack{
            VStack{
                HStack{
                    Button("<-"){
                        pushButton(buttonFunction: .backspace)
                        releaseButton(buttonFunction: .backspace)
                        print("Backspace")
                    }
                    .buttonStyle(FrontPanelButton(width: 65, height: 65*1.25, backgroundColor: .gray))
                    VStack{
                        Button("-"){
                            print("Minus")
                        }.buttonStyle(FrontPanelButton(width: 65, height: (65/2), backgroundColor: .gray))
                            .pressActions {
                                print("Pressed")
                                pushButton(buttonFunction: .minus)
                            } onRelease: {
                                releaseButton(buttonFunction: .minus)
                            }
                        Button("/"){
                            print("Slash")
                        }.buttonStyle(FrontPanelButton(width: 65, height: (65/2), backgroundColor: .gray))
                            .pressActions {
                                print("Pressed")
                                pushButton(buttonFunction: .slash)
                            } onRelease: {
                                releaseButton(buttonFunction: .slash)
                            }
                    }
                    VStack{
                        Button("+"){
                            print("Plus")
                        }.buttonStyle(FrontPanelButton(width: 65, height: (65/2), backgroundColor: .gray))
                            .pressActions {
                                print("Pressed")
                                pushButton(buttonFunction: .plus)
                            } onRelease: {
                                releaseButton(buttonFunction: .plus)
                            }
                        Button("Full"){
                            print("Full")
                        }.buttonStyle(FrontPanelButton(width: 65, height: (65/2), backgroundColor: .gray))
                            .pressActions {
                                print("Pressed")
                                pushButton(buttonFunction: .full)
                            } onRelease: {
                                releaseButton(buttonFunction: .full)
                            }
                    }
                    VStack{
                        Button("Thru"){
                            print("Thru")
                        }.buttonStyle(FrontPanelButton(width: 65, height: (65/2), backgroundColor: .gray))
                            .pressActions {
                                print("Pressed")
                                pushButton(buttonFunction: .thru)
                            } onRelease: {
                                releaseButton(buttonFunction: .thru)
                            }
                        Button("@"){
                            print("@")
                        }.buttonStyle(FrontPanelButton(width: 65, height: (65/2), backgroundColor: .gray))
                            .pressActions {
                                print("Pressed")
                                pushButton(buttonFunction: .at)
                            } onRelease: {
                                releaseButton(buttonFunction: .at)
                            }
                    }
                }
                HBCButtonView()
                // Used to open windows with different sets of buttons in them.
                HStack{
                    // Encoders
                    Button {
                        isEncoderShown.toggle()
                    } label: {
                        Image(systemName: "dial.max")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                        .sheet(isPresented: $isEncoderShown, content: {
                            EncodersKindsSheet()
                                .environmentObject(osc)
                        })
                    // Object Keys, Action Keys, & utility keys
                    Button {
                        isActionShown.toggle()
                    } label: {
                        Image(systemName: "rectangle.3.offgrid")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                        .sheet(isPresented: $isActionShown) {
                            isActionShown = false
                        } content: {
                            ObjActUtilKeys().environmentObject(osc)
                        }
                    // Function keys
                    Button {
                        isFunctionShown.toggle()
                    } label: {
                        Image(systemName: "square.grid.3x3")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                        .sheet(isPresented: $isFunctionShown) {
                            isFunctionShown = false
                        } content: {
                            FunctionKeySheet().environmentObject(osc)
                        }
                }
                SelectButtonView()
            }
            Spacer()
            // NUMBER PAD
            VStack(spacing: 1){
                HStack(spacing: 1){
                    Button("7"){print(7)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "7")
                    } onRelease: {
                        releaseButton(number: "7")
                    }
                    
                    Button("8"){print(8)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "8")
                    } onRelease: {
                        releaseButton(number: "8")
                    }
                    Button("9"){print(9)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "9")
                    } onRelease: {
                        releaseButton(number: "9")
                    }
                }
                HStack(spacing: 1){
                    Button("4"){print(4)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "4")
                    } onRelease: {
                        releaseButton(number: "4")
                    }
                    
                    Button("5"){print(5)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "5")
                    } onRelease: {
                        releaseButton(number: "5")
                    }
                    Button("6"){print(6)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "6")
                    } onRelease: {
                        releaseButton(number: "6")
                    }
                }
                HStack(spacing: 1){
                    Button("1"){print(1)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "1")
                    } onRelease: {
                        releaseButton(number: "1")
                    }
                    
                    Button("2"){print(2)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "2")
                    } onRelease: {
                        releaseButton(number: "2")
                    }
                    Button("3"){print(3)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "3")
                    } onRelease: {
                        releaseButton(number: "3")
                    }
                }
                HStack(spacing: 1){
                    Button("0"){print(0)}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(number: "0")
                    } onRelease: {
                        releaseButton(number: "0")
                    }
                    
                    Button("."){print(".")}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(buttonFunction: .period)
                    } onRelease: {
                        releaseButton(buttonFunction: .period)
                    }
                    Button("Enter"){print("Enter")}
                    .buttonStyle(FrontPanelButton(width: buttonSize, backgroundColor: .gray))
                    .pressActions {
                        pushButton(buttonFunction: .enter)
                    } onRelease: {
                        releaseButton(buttonFunction: .enter)
                    }
                }
            }
        }
        .padding(.horizontal)
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

struct RegCompFPProgrammer_Previews: PreviewProvider {
    static var previews: some View {
        RegCompFPProgramming()
    }
}
