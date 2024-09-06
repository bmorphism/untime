//
//  State.swift
//  time Watch App
//
//  Created by barton on 9/6/24.
//

import Foundation
import Combine



enum Currency {
    
    case bitcoin
    case ethereum
    case solana
    
    var symbol: String {
        switch self {
        case .bitcoin:
            return "BTC"
        case .ethereum:
            return "ETH"
        case .solana:
            return "SOL"
        }
    }
    
    var apiUrl: URL {
        switch self {
        case .bitcoin:
            return URL(string: "https://blockchain.info/q/getblockcount")!
        case .ethereum:
            return URL(string: "https://api.blockcypher.com/v1/eth/main")!
        case .solana:
            return URL(string: "https://api.mainnet-beta.solana.com")!
        }
    }
    
}

struct HyperduckState {
    
    var selectedCurrency: Currency = .bitcoin
    var blockHeight: Int?
    
}
