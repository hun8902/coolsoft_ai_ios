//
//  AccountView.swift
//  SwiftUIStarterKitApp
//
//  Created by Osama Naeem on 08/08/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    @State var notificationToggle: Bool = false
    @State var locationUsage: Bool = false
    @State var username: String = "김영훈"
    @State var selectedCurrency: Int = 0
    @State var currencyArray: [String] = ["$ US Dollar", "£ GBP", "€ Euro"]
    
    @State var selectedPaymentMethod: Int = 1
    @State var paymentMethodArray: [String] = ["카카오페이", "신용카드", "비트코인"]
    
    var body: some View {
        GeometryReader { g in
            VStack {
                Image("italy")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.yellow)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                Text("김영훈 / 앱 제작자")
                    .font(.system(size: 20))
                    
                Form {
                    Section(header: Text("프로필 정보")) {
                        HStack {
                            Text("회원등급")
                            Spacer()
                            Text("관리자")
                        }

                       NavigationLink(destination: Text("프로필 수정")) {
                            Text("프로필 수정")
                        }
                       
                        NavigationLink(destination: Text("결제 내역")) {
                            Text("결제 내역")
                        }
                    }

                    
                    Section(header: Text("결제 설정")) {
                        /*
                         Picker(selection: self.$selectedCurrency, label: Text("결제수단")) {
                                         ForEach(0 ..< self.currencyArray.count) {
                                                  Text(self.currencyArray[$0]).tag($0)
                                            }
                        }
                        */
                        
                        Picker(selection: self.$selectedPaymentMethod, label: Text("결제수단")) {
                                  ForEach(0 ..< self.paymentMethodArray.count) {
                                       Text(self.paymentMethodArray[$0]).tag($0)
                                     }
                        }
                        Button(action: {
                            print("Button tapped")
                            
                        }) {
                            
                            if (self.paymentMethodArray[self.selectedPaymentMethod]) == "Credit/Debit Card" {
                                Text("Add a Credit/Debit Card to your account")
                                
                            } else {
//                                Text("Connect \(self.paymentMethodArray[self.selectedPaymentMethod]) to your account")
                                Text("결제수단 추가")
                                
                            }
                        }

                    }
                                        
                    Section(footer: Text("알람 설정를 설정하실 경우 앱 푸시가 가지 않습니다")) {
                        Toggle(isOn: self.$locationUsage) {
                              Text("페이스아이디 사용")
                        }
                        Toggle(isOn: self.$notificationToggle) {
                            Text("알람 설정")
                        }
                        HStack {
                            Text("버전 정보")
                            Spacer()
                            Text("개발 테스트 v0.4.6")
                        }
                    }
                        
            }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .navigationBarTitle("설정")
         }
        }
    }
 }

