//
//  Detail.swift
//  poketmon-Encyclopedia
//
//  Created by 송명균 on 7/30/25.
//

// View/PokemonDetailViewController.swift
import UIKit
import SnapKit

final class PokemonDetailViewController: UIViewController {
    private let containerView = UIView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let typeLabel = UILabel()
    private let heightLabel = UILabel()
    private let weightLabel = UILabel()

    private let pokemon: Pokemon

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainRed
        setupUI()
        configure()
    }
//MARK: UI 구성
    private func setupUI() {
        view.addSubview(containerView)
        containerView.backgroundColor = UIColor.darkRed
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        [imageView, nameLabel, typeLabel, heightLabel, weightLabel].forEach {
            containerView.addSubview($0)
            if let label = $0 as? UILabel {
                label.textAlignment = .center
                label.textColor = .white
                label.font = .systemFont(ofSize: 16, weight: .medium)
                label.numberOfLines = 0
            }
        }

        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
            make.width.height.equalTo(200)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            nameLabel.font = .systemFont(ofSize: 30, weight: .bold)
        }

        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }

        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }

        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }

    private func configure() {
        if let urlStr = pokemon.sprites.front_default, let url = URL(string: urlStr) {
            imageView.kf.setImage(with: url)
        }
         //포켓몬 번역
        let translatedName = PokemonTranslator.getKoreanName(for: pokemon.name)
        let translatedTypes = pokemon.types.map { getkoreanTypeName(for: $0.type.name)
        }.joined(separator: ", ")
        let pokeHeight: Double = Double(pokemon.height) / 10.0
        let pokeWeight: Double = Double(pokemon.weight) / 10.0

        nameLabel.text = "NO.\(pokemon.id)  \(translatedName)"
        typeLabel.text = "타입: \(translatedTypes)"
        heightLabel.text = "키: \(pokeHeight) m"
        weightLabel.text = "몸무게: \(pokeWeight) kg"
    }
}
