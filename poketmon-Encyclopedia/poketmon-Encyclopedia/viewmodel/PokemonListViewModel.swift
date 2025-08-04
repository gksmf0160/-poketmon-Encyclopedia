//
//  PokemonListViewModel.swift
//  poketmon-Encyclopedia
//
//  Created by 송명균 on 7/30/25.
//

import Foundation
import RxSwift
import RxCocoa

final class PokemonListViewModel {
    let pokemons = BehaviorRelay<[Pokemon]>(value: [])
    let filtered = BehaviorRelay<[Pokemon]>(value: [])
    private let disposeBag = DisposeBag()
    private var currentPage = 1
    private let pageSize = 20
    private var isFetching = false

    func fetchPokemons() {
        guard !isFetching else { return }
        isFetching = true

        let ids = Array(currentPage..<(currentPage + pageSize))
        currentPage += pageSize

        Observable.from(ids)
            .flatMap { id -> Observable<Pokemon?> in
                guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else { return .just(nil) }
                return URLSession.shared.rx.data(request: URLRequest(url: url))
                    .map { try? JSONDecoder().decode(Pokemon.self, from: $0) }
                    .catchAndReturn(nil)
            }
            .compactMap { $0 }
            .toArray()
            .subscribe(onSuccess: { [weak self] newPokemons in
                guard let self = self else { return }
                let updated = self.pokemons.value + newPokemons
                self.pokemons.accept(updated.sorted(by: { $0.id < $1.id }))
                self.filtered.accept(self.pokemons.value)
                self.isFetching = false
            })
            .disposed(by: disposeBag)
    }

    func search(query: String) {
            if query.isEmpty {
                filtered.accept(pokemons.value)
            } else {
                let result = pokemons.value.filter {
                    let koreanName = PokemonTranslator.getKoreanName(for: $0.name)
                    return koreanName.contains(query) || "\($0.id)" == query
                }
                filtered.accept(result)
            }
        }
    }
