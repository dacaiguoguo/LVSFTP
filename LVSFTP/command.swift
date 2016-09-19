//
//  command.swift
//  LVSFTP
//
//  Created by yanguo sun on 19/09/2016.
//  Copyright © 2016 Lvmama. All rights reserved.
//

import Foundation
class TestCommand: NSObject {
    func lsCommand() -> Void {
        let errorPipe = Pipe()
        let outputPipe = Pipe()
        let task = Process()
        task.standardError = errorPipe
        task.standardOutput = outputPipe
        task.launchPath = "/bin/ls"
        task.currentDirectoryPath = "/Users/sunyanguo/Desktop"
        task.arguments = ["-a"]
        task.launch()
        task.waitUntilExit()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()

        let outputString = String(data: outputData, encoding: .utf8)
        let outputArray = outputString?.components(separatedBy: "\n");
        print(outputArray)
    }
    
    func cmsCommand() -> String {
        let errorPipe = Pipe()
        let outputPipe = Pipe()
        let task = Process()
        task.standardError = errorPipe
        task.standardOutput = outputPipe
        task.launchPath = "/usr/bin/security"
        task.currentDirectoryPath = "/Users/sunyanguo/Desktop"
        task.arguments = ["cms", "-D", "-i", "2222.mobileprovision"]
        task.launch()
        task.waitUntilExit()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        
        let outputString = String(data: outputData, encoding: .utf8)
        return outputString!
    }
    
//    security cms -D -i 2222.mobileprovision -o 2222.plist

}
