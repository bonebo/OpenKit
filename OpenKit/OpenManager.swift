//
//  OpenManager.swift
//  OpenKit
//
//  Created by William Lee on 09/03/2018.
//  Copyright © 2018 William Lee. All rights reserved.
//

import Foundation

public class OpenManager {
  
  /// 注册微信开放平台SDK
  ///
  /// - Parameters:
  ///   - appID: 开放平台AppID
  ///   - appSecret: 开放平台AppSecret
  public class func registerWeChatSDK(withAppID appID: String, appSecret: String) {
    
    WeChatManager.register(appID, appSecret)
  }
  
  /// 注册新浪微博开放平台SDK
  ///
  /// - Parameters:
  ///   - appID: 开放平台AppID
  ///   - appKey: 开放平台AppKey
  ///   - redirectURI: 开放平台回调地址
  public class func registerSinaWeibo(withAppID appID: String, appKey: String, redirectURI: String) {
    
    SinaWeiboManager.register(appID, appKey, redirectURI)
  }
  
  /// 注册支付宝开放平台SDK
  ///
  /// - Parameter scheme: 调用支付的app注册在info.plist中的scheme，用于回调唤起应用
  public class func registerAlipay(withScheme scheme: String) {
  
    AlipayManager.register(scheme)
  }
  
  /// 开放平台唤起应用时回调
  ///
  /// - Parameter url: 回调地址
  /// - Returns: 是否可以回调
  public class func handleOpen(_ url: URL) -> Bool {
    
    return WeChatManager.handleOpen(url) || SinaWeiboManager.handleOpen(url) || AlipayManager.handleOpen(url)
  }
  
}

public extension OpenManager {
  
  /// 是否安装了微信
  class func isInstallWeChat() -> Bool {
    
    return WeChatManager.isInstall()
  }
  
  /// 是否安装了新浪微博
  class func isInstallSinaWeibo() -> Bool {
    
    return SinaWeiboManager.isInstall()
  }
  
}








