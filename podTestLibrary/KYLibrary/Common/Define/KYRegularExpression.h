//
//  KYRegularExpression.h
//  icfappIOS
//
//  Created by xwzhou on 16/3/18.
//  Copyright © 2016年 kaiyuandao. All rights reserved.
//

/**********************************************
 正则表达式相关
 **********************************************/
#define REG_CKYLPHONE @"^((\\+?86)|(\\(\\+86\\)))?1[3,4,5,7,8]\\d{9}$"
#define REG_PASSWORD_DIGITAL @"^[0-9]*$"
#define REG_PASSWORD_LETTER @"^[a-zA-Z]*$"
#define REG_PASSWORD_SAME_WORDS @"(.)\\1{%d}"
#define REG_VALID_WORDS @"^[a-zA-Z0-9!@#$%^&*_-]*$"
#define REG_letter_digit @"^[a-zA-Z0-9]*$" //字母数字组合
#define REG_letter_digit_chinese @"^[a-zA-Z0-9\u4E00-\u9FFF]*$" //字母数字汉字组合
#define REG_CHINESE @"[\u4E00-\u9FFF]+$"   //全是汉字
#define REG_CHINESE_AT_LEAST_ONE @"^.*[\u4e00-\u9fa5].*$" //至少包含一个汉字
#define REG_IDENTITY @"(^\\d{18}$)|(^\\d{17}(\\d|X|x)$)"
#define REG_EMAIL @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REG_TKYEPHONE @"^(0[0-9]{2,4}-)([2-9][0-9]{6,7})+(-[0-9]{1,5})?$" //座机，带区号，带分机号（非必要）


//单位电话分为区号.座机.分机号,希望对各个部分做一下位数限制,
//
//区号最多4位,当输入4位数字后自动跳到座机部分
//
//座机最多8位,当输入8位数字后自动跳到分机号
//
//分机最多6位

//#define REG_TKYEPHONE_AREA_CODE @"^0[0-9]{2,4}$" //区号
//#define REG_TKYEPHONE_PHONE_ONLY @"^[2-9][0-9]{6,7}$"  //座机，不带区号和分机号
//#define REG_TKYEPHONE_EXTENSION_NUMBER @"^[0-9]{1,5}$" //分机号

#define REG_TKYEPHONE_AREA_CODE @"^0[0-9]{2,3}$" //区号
#define REG_TKYEPHONE_PHONE_ONLY @"^[2-9][0-9]{6,7}$"  //座机，不带区号和分机号
#define REG_TKYEPHONE_EXTENSION_NUMBER @"^[0-9]{1,6}$" //分机号

#define REG_HUNDREDNUM @"^[1-9]\\d*00$"
