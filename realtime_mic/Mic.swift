//
//  Mic.swift
//  realtime_mic
//
//  Created by π on 16/07/2019.
//  Copyright © 2019 π. All rights reserved.
//

import AVFoundation // AVAudioEngine

class Mic
{
    public let audioEngine = AVAudioEngine()

    func startRecording() throws
    {
        // https://forums.developer.apple.com/thread/44833
        audioEngine.mainMixerNode  // causes DIFFERENT crash!

        audioEngine.prepare()  // CRASHES


        let inputNode = audioEngine.inputNode
        if inputNode.inputFormat(forBus: 0).sampleRate == 0 {
            exit(0);
        }

        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            // self.recognitionRequest?.append(buffer)
            print( "YES! Got some samples!")
        }

        audioEngine.prepare()

        try audioEngine.start()
    }

    //public
    func stopRecording()
    {
        audioEngine.stop()
    }
}
