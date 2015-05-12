//
//  AdtUser.m
//  QiYReader
//
//  Created by 奇阅科技 on 14-11-15.
//  Copyright (c) 2014年 奇阅科技. All rights reserved.
//

#import "AdtUser.h"

@implementation AdtUser
+(NSString *)getTableName
{
    return @"AdtUser";
}
//-(instancetype)init{
//    self = [super init];
//    if (self) {
//        self.auto_subscription = YES;
//    }
//    return self;
//}
- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self != nil) {
        self.uid = [decoder decodeObjectForKey:@"uid"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.mobile = [decoder decodeObjectForKey:@"mobile"];
        self.status = [decoder decodeObjectForKey:@"status"];
        self.headimg= [decoder decodeObjectForKey:@"headimg"];
        self.can_carry= [decoder decodeObjectForKey:@"can_carry"];
        self.profilt_accumulated= [decoder decodeObjectForKey:@"profilt_accumulated"];
        self.profit_yestoday= [decoder decodeObjectForKey:@"profit_yestoday"];
        self.total_assets= [decoder decodeObjectForKey:@"total_assets"];
        self.user_type = [decoder decodeObjectForKey:@"user_type"];
        self.student_school_name = [decoder decodeObjectForKey:@"student_school_name"];
        self.student_school_address = [decoder decodeObjectForKey:@"student_school_address"];
        self.student_class_name = [decoder decodeObjectForKey:@"student_class_name"];
        self.student_admission_time = [decoder decodeObjectForKey:@"student_admission_time"];
        self.student_school_roll_screenshot = [decoder decodeObjectForKey:@"student_school_roll_screenshot"];
        self.student_student_id_photo = [decoder decodeObjectForKey:@"student_student_id_photo"];
        self.worker_company_name = [decoder decodeObjectForKey:@"worker_company_name"];
        self.worker_company_address = [decoder decodeObjectForKey:@"worker_company_address"];
        self.worker_position = [decoder decodeObjectForKey:@"worker_position"];
        self.worker_home_address = [decoder decodeObjectForKey:@"worker_home_address"];
        self.worker_accumulation_fund_account = [decoder decodeObjectForKey:@"worker_accumulation_fund_account"];
        self.worker_accumulation_fund_password = [decoder decodeObjectForKey:@"worker_accumulation_fund_password"];
        self.worker_ssp = [decoder decodeObjectForKey:@"worker_ssp"];
        self.worker_employees_card = [decoder decodeObjectForKey:@"worker_employees_card"];
        self.id_card_photo = [decoder decodeObjectForKey:@"id_card_photo"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {//status
    [encoder encodeObject:self.uid forKey:@"uid"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.mobile forKey:@"mobile"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeObject:self.headimg forKey:@"headimg"];
    [encoder encodeObject:self.can_carry forKey:@"can_carry"];
    [encoder encodeObject:self.profilt_accumulated forKey:@"profilt_accumulated"];
    [encoder encodeObject:self.profit_yestoday forKey:@"profit_yestoday"];
    [encoder encodeObject:self.total_assets forKey:@"total_assets"];
    [encoder encodeObject:self.user_type forKey:@"user_type"];
    [encoder encodeObject:self.student_school_name forKey:@"student_school_name"];
    [encoder encodeObject:self.student_school_address forKey:@"student_school_address"];
    [encoder encodeObject:self.student_class_name forKey:@"student_class_name"];
    [encoder encodeObject:self.student_admission_time forKey:@"student_admission_time"];
    [encoder encodeObject:self.student_school_roll_screenshot forKey:@"student_school_roll_screenshot"];
    [encoder encodeObject:self.student_student_id_photo forKey:@"student_student_id_photo"];
    [encoder encodeObject:self.worker_company_name forKey:@"worker_company_name"];
    [encoder encodeObject:self.worker_company_address forKey:@"worker_company_address"];
    [encoder encodeObject:self.worker_position forKey:@"worker_position"];
    [encoder encodeObject:self.worker_home_address forKey:@"worker_home_address"];
    [encoder encodeObject:self.worker_accumulation_fund_account forKey:@"worker_accumulation_fund_account"];
    [encoder encodeObject:self.worker_accumulation_fund_password forKey:@"worker_accumulation_fund_password"];
    [encoder encodeObject:self.worker_ssp forKey:@"worker_ssp"];
    [encoder encodeObject:self.worker_employees_card forKey:@"worker_employees_card"];
    [encoder encodeObject:self.id_card_photo forKey:@"id_card_photo"];
}
//+(AdtUser *)getFromDict:(NSDictionary *)dict{
//    AdtUser *user = [AdtUser new];
//    user.uid = [dict objectForKey:@"uid"];
//    user.username = [dict objectForKey:@"username"];
//    user.mobile = [dict objectForKey:@"mobile"];
//    user.email = [dict objectForKey:@"email"];
//    user.token = [dict objectForKey:@"token"];
//    user.vip_level = [dict objectForKey:@"vip_level"];
//    user.is_baoyue = [dict objectForKey:@"is_baoyue"];
//    user.nickname = [dict objectForKey:@"nickname"];
//    user.headimg = [dict objectForKey:@"headimg"];
//    user.remain = [dict objectForKey:@"remain"];
//    if (user.remain.length <1) {
//        user.remain = @"0";
//    }
//    user.points = [dict objectForKey:@"points"];
//    if (user.points.length<1) {
//        user.points = @"0";
//    }
//    user.hadBuyNum = [dict objectForKey:@"hadBuyNum"];
//    if (user.hadBuyNum.length<1) {
//        user.hadBuyNum = @"--";
//    }
//    user.bookReviewNum = [dict objectForKey:@"bookReviewNum"];
//    if (user.bookReviewNum.length<1) {
//        user.bookReviewNum = @"--";
//    }
//    user.collectionNum = [dict objectForKey:@"collectionNum"];
//    if (user.collectionNum.length<1) {
//        user.collectionNum = @"--";
//    }
//    return user;
//}
@end
