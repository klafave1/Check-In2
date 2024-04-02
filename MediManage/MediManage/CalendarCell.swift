import UIKit

class CalendarCell: UICollectionViewCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DayHeaderView: UICollectionReusableView {
    private let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    private var labels: [UILabel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLabels() {
        for (index, day) in daysOfWeek.enumerated() {
            let label = UILabel()
            label.text = day
            label.font = UIFont.systemFont(ofSize: 12)
            label.textAlignment = .center
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            labels.append(label)

            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: topAnchor),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(index) * (frame.width / CGFloat(daysOfWeek.count))),
                label.widthAnchor.constraint(equalToConstant: frame.width / CGFloat(daysOfWeek.count)),
                label.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }

    func configure() {
        for (index, label) in labels.enumerated() {
            label.frame = CGRect(x: CGFloat(index) * (frame.width / CGFloat(daysOfWeek.count)), y: 0, width: frame.width / CGFloat(daysOfWeek.count), height: 30)
        }
    }
}

// Sources:
//https://developer.apple.com/documentation/corefoundation/cgrect
//https://developer.apple.com/documentation/foundation/nscoder
