# CustomMenuBar




1. Add these two files in your project
 - MenuBar.swift
 - MenuBarCell.swift

2. Inside viewdidload method of your file (on which you want to show menubar) add this below method
 addMenuBar()

3. copy and paste this below code  in your file (on which you want to show menubar).

  
 
 
 let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
  
  
  func addMenuBar()  {
        view.addSubview(menuBar)
        
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
   
