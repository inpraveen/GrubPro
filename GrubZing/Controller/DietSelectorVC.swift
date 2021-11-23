//
//  DietSelectorVC.swift
//  GrubZing
//
//  Created by WFX on 10/08/21.
//

import UIKit

class DietSelectorVC: UIViewController ,UITableViewDelegate,  UITableViewDataSource {
   
    
    @IBOutlet weak var dietTableView: UITableView!
    
   
    
//    let tableview: UITableView = {
//            let tv = UITableView()
//            tv.backgroundColor = UIColor.white
//            tv.translatesAutoresizingMaskIntoConstraints = false
//            return tv
//        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupTableView()

     
        
        // Do any additional setup after loading the view.
    }
    
//    func setupTableView() {
////        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
//        tableview.register(DietTableViewCell.self, forCellReuseIdentifier: "DietTableViewCell")
//
//
//        tableview.delegate = self
//        tableview.dataSource = self
//
//        view.addSubview(tableview)
//
//        NSLayoutConstraint.activate([
//            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
//            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
//        ])
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dietTableView.dequeueReusableCell(withIdentifier: "DietTableViewCell", for: indexPath) as! DietTableViewCell

        cell.backgroundColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }

    
    @IBAction func continueButtonAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DietDateVC") as! DietDateVC
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
class DietTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var dietImage: UIImageView!
    @IBOutlet weak var dietName: UILabel!

    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupView()
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    let cellView: UIView = {
//            let view = UIView()
//            view.backgroundColor = UIColor.red
//            view.layer.cornerRadius = 10
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
//
//        let dayLabel: UILabel = {
//            let label = UILabel()
//            label.text = "Vegitarian"
//            label.textColor = UIColor.white
//            label.font = UIFont.boldSystemFont(ofSize: 16)
//            label.translatesAutoresizingMaskIntoConstraints = false
//            return label
//        }()
//
//    func setupView() {
//        addSubview(cellView)
//        cellView.addSubview(dayLabel)
//        self.selectionStyle = .none
//
//        NSLayoutConstraint.activate([
//            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
//            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
//            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//
//        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
//        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
//
//    }
}
