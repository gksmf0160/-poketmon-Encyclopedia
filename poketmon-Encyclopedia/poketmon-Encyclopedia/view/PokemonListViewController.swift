//
//  ViewController.swift
//  poketmon-Encyclopedia
//
//  Created by 송명균 on 7/29/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class PokemonListViewController: UIViewController {
    private let searchBar = UISearchBar()
    
    private let pokeballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poketmon-ball") 
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 8
        let itemWidth = (UIScreen.main.bounds.width - 32) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    private let viewModel = PokemonListViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainRed
        setupUI()
        bind()
        viewModel.fetchPokemons()
    }

    private func setupUI() {
        title = "이전"
        navigationItem.titleView = searchBar

        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.identifier)
        collectionView.backgroundColor = UIColor.darkRed

       
        view.addSubview(pokeballImageView)
        view.addSubview(collectionView)

        // pokeballImageView 제약
        pokeballImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(pokeballImageView.snp.bottom).offset(16)
            $0.left.right.bottom.equalToSuperview()
        }
    }

    private func bind() {
        // SearchBar 검색 바인딩
        searchBar.rx.text.orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind(onNext: { [weak self] in self?.viewModel.search(query: $0) })
            .disposed(by: disposeBag)

        //  filtered 포켓몬 → collectionView 바인딩
        viewModel.filtered
            .bind(to: collectionView.rx.items(cellIdentifier: PokemonCell.identifier, cellType: PokemonCell.self)) { _, model, cell in
                cell.configure(with: model)
            }
            .disposed(by: disposeBag)

        //  셀 선택 시 상세화면 push
        collectionView.rx.modelSelected(Pokemon.self)
            .subscribe(onNext: { [weak self] pokemon in
                self?.navigationController?.pushViewController(PokemonDetailViewController(pokemon: pokemon), animated: true)
            })
            .disposed(by: disposeBag)

        //  무한 스크롤 처리
        collectionView.rx.contentOffset
            .subscribe(onNext: { [weak self] offset in
                guard let self = self else { return }
                let contentHeight = self.collectionView.contentSize.height
                let offsetY = offset.y + self.collectionView.frame.size.height
                if offsetY > contentHeight - 200 {
                    self.viewModel.fetchPokemons()
                }
            })
            .disposed(by: disposeBag)
    }
}
