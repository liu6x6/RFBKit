//
//  File.swift
//  
//
//  Created by Henrik Storch on 16.06.21.
//

import Foundation

/**
AES encryption/decryption class
*/
public class AESCipher: NSObject, BlockCryptor {
    public var coreCryptor: CoreCryptor
    
    /**
    Initialization vector (get only)
    */
    public var iv: Data? {
        return (coreCryptor as! AESCoreCipher).iv
    }
    
    /**
    Encryption key (get only)
    */
    public var key: Data? {
        return (coreCryptor as! AESCoreCipher).key
    }
        
    /**
    Creates new AESCipher object with encryption key, initialization vector and block cipher mode
    
    - parameter key: Encryption/decryption key
    - parameter iv: Initialization vector
    - parameter blockMode: AES block mode
    */
    public init(key: Data, iv: Data, blockMode: AESBlockCipherMode) throws {
        do {
            coreCryptor = try AESCoreCipher(key: key, iv: iv, blockMode: blockMode)
        }
        catch let error {
            throw error
        }
        
        super.init()
    }
}
