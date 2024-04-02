import UIKit

class ViewController: UIViewController, CalendarViewDelegate, MedicationListViewControllerDelegate {
    private let calendarView = CalendarView()
    private var currentDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Medication Management"
        view.backgroundColor = .white

        setupCalendarView()
    }

    private func setupCalendarView() {
        calendarView.delegate = self
        view.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func didSelectDate(_ date: Date) {
        self.currentDate = date
        showMedicationList(for: date)
    }

    private func showMedicationList(for date: Date) {
        let medicationListViewController = MedicationListViewController()
        medicationListViewController.selectedDate = date
        medicationListViewController.delegate = self
        navigationController?.pushViewController(medicationListViewController, animated: true)
    }

    func didEditMedication() {
        if let date = currentDate {
            calendarView.reloadData()
        }
    }
}

// Sources:
// https://developer.apple.com/documentation/uikit
//https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/
