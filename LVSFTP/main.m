//
//  main.m
//  LVSFTP
//
//  Created by yanguo sun on 18/09/2016.
//  Copyright © 2016 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMSSH.h"
#import "LVSFTP-Swift.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");

        
        
        NMSSHSession *session = [[NMSSHSession alloc] initWithHost:@"192.168.0.1:22" andUsername:@"admin"];
        [session connect];
        
        if (session.isConnected) {
            [session authenticateByPassword:@"admin"];
            
            if (session.isAuthorized) {
                [session.sftp connect];
                
                NSArray *remoteFileList = [session.sftp contentsOfDirectoryAtPath:@"/path/ios/"];
                for (NMSFTPFile *file in remoteFileList) {
                    NSLog(@"%@", file.filename);
                }
                NSString *content = [[NSString alloc] initWithData:[session.sftp contentsAtPath:@"/path/ios/js.txt"] encoding:NSUTF8StringEncoding];
                NSLog(@"%@",content);
                BOOL writeResult = [session.sftp writeContents:[@"abc11" dataUsingEncoding:NSUTF8StringEncoding] toFileAtPath:@"/path/ios/js.txt"];
                assert(writeResult);
            }
            
            [session disconnect];
        }
        TestCommand *aCommand = [[TestCommand alloc] init];
        [aCommand lsCommand];
        id abc =  [aCommand cmsCommand];
        if ([abc isKindOfClass:[NSString class]]) {
            NSLog(@"%@",abc);
        }

    }
    return 0;
}
