//
//  GameListViewModel.swift
//  rhythmScore
//  
//  Created by shsw228 on 2023/02/05
//


import Foundation
import Combine

protocol GameListViewModelable {
    var listSubject: CurrentValueSubject<[GameEntity],Never>{ get }
    
}

class GameListViewModel {
    var listSubject =  CurrentValueSubject<[GameEntity],Never>([])
    
}

extension GameListViewModel: GameListViewModelable {
    
}
