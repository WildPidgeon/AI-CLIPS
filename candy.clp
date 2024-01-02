

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   



(defrule system-banner ""

  =>
  
  (assert (UI-state (display "What should I Eat?")
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))





(defrule determine-Question-japan ""

   (logical (start))

   =>

   (assert (UI-state (display "Are you in japan?")
                     (relation-asserted Japan)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-Question-movies ""

   (logical (Japan No))

   =>

   (assert (UI-state (display "Are you at the movies?")
                     (relation-asserted Movie)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-depression ""

   (logical (Movie No))

   =>

   (assert (UI-state (display "Were you raised during the great depression?")
                     (relation-asserted depression)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-Question-Stallyns ""

   (logical (depression No))

   =>

   (assert (UI-state (display "Are you a member of Wyld Stallyns?")
                     (relation-asserted member)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-fair ""

   (logical (member No))

   =>

   (assert (UI-state (display "Are you at the fair?")
                     (relation-asserted fair)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-teeth ""

   (logical (fair No))

   =>

   (assert (UI-state (display "Do you care about your teeth?")
                     (relation-asserted teeth)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-Thurgod ""

   (logical (teeth Yes))

   =>

   (assert (UI-state (display "Is your name Thurgood?")
                     (relation-asserted Thurgood)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-bucket ""

   (logical (Thurgood No))

   =>

   (assert (UI-state (display "Are you Charlie Bucket?")
                     (relation-asserted Bucket)
                     (response No)
                     (valid-answers No Yes))))
					 
(defrule determine-Question-vendingmachine ""
  
   (logical (Bucket No))

   =>
   
   (assert (UI-state (display "Are you at a vending machine?")
                     (relation-asserted machine)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-16yo ""

   (logical (machine No))

   =>

   (assert (UI-state (display "Are you under 16 years old?")
                     (relation-asserted years)
                     (response Normal)
                     (valid-answers No Yes))))

(defrule determine-Question-chalk ""
   
   (logical (years No))

   =>

   (assert (UI-state (display "Do you like eating chalk?")
                     (relation-asserted chalk)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-Question-10yo ""
  
   (logical (years Yes))

   =>
   
   (assert (UI-state (display "Are you under 10 years old?")
                     (relation-asserted under)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-Question-play ""
  
   (logical (chalk No))

   =>
   
   (assert (UI-state (display "Do you want to play with it?")
                     (relation-asserted play)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-fruity ""
  
   (logical (play No))

   =>
   
   (assert (UI-state (display "Do you want something fruity?")
                     (relation-asserted fruity)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-rainbow ""
  
   (logical (fruity Yes))

   =>
   
   (assert (UI-state (display "Do you want to taste the rainbow?")
                     (relation-asserted rainbow)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-licorice ""
  
   (logical (fruity No))

   =>
   
   (assert (UI-state (display "Do you want licorice?")
                     (relation-asserted licorice)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-easter ""
  
   (logical (licorice No))

   =>
   
   (assert (UI-state (display "Is it Easter?")
                     (relation-asserted easter)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-Question-liqourice ""
  
   (logical (licorice Yes))

   =>
   
   (assert (UI-state (display "...real liqourice?")
                     (relation-asserted real)
                     (response No)
                     (valid-answers No Yes))))
					 
(defrule determine-Question-diet ""
  
   (logical (easter No))

   =>
   
   (assert (UI-state (display "Are you on a diet?")
                     (relation-asserted diet)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-Question-truckstop ""
  
   (logical (diet No))

   =>
   
   (assert (UI-state (display "Are you at a truck stop?")
                     (relation-asserted truck)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-Question-coconut ""
  
   (logical (truck No))

   =>
   
   (assert (UI-state (display "Do you like coconut?")
                     (relation-asserted coconut)
                     (response No)
                     (valid-answers No Yes))))



(defrule determine-Question-cushions ""
  
   (logical (coconut No))

   =>
   
   (assert (UI-state (display "Were you searching in the couch cushions?")
                     (relation-asserted search)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-toothpaste ""
  
   (logical (search No))

   =>
   
   (assert (UI-state (display "Do you like eating toothpaste?")
                     (relation-asserted paste)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-sundae ""
  
   (logical (paste No))

   =>
   
   (assert (UI-state (display "Are you making a sundae?")
                     (relation-asserted sundae)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-nothingelse ""
  
   (logical (sundae No))

   =>
   
   (assert (UI-state (display "Is there nothing else?")
                     (relation-asserted nothing)
                     (response No)
                     (valid-answers No Yes))))





(defrule determine-Question-oldfash ""
  
   (logical (nothing No))

   =>
   
   (assert (UI-state (display "Are You old-fashioned?")
                     (relation-asserted fashion)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-month ""
  
   (logical (fashion No))

   =>
   
   (assert (UI-state (display "Is it that time of the month?")
                     (relation-asserted time)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-classic ""
  
   (logical (fashion Yes))

   =>
   
   (assert (UI-state (display "... and classic?")
                     (relation-asserted classic)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-nuts ""
  
   (logical (time No))

   =>
   
   (assert (UI-state (display "Do you love nuts?")
                     (relation-asserted nuts)
                     (response No)
                     (valid-answers No Yes))))





(defrule determine-Question-chocolate ""
  
   (logical (nuts No))

   =>
   
   (assert (UI-state (display "Do you want chocolate?")
                     (relation-asserted chocolate)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-Question-bite ""
  
   (logical (chocolate Yes))

   =>
   
   (assert (UI-state (display "Do you want something with a bite?")
                     (relation-asserted bite)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-Question-mouth ""
  
   (logical (bite No))

   =>
   
   (assert (UI-state (display "Do you want your mouth to love you?")
                     (relation-asserted mouth)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Question-christmas ""
  
   (logical (mouth No))

   =>
   
   (assert (UI-state (display "Is it christmas?")
                     (relation-asserted christmas)
                     (response No)
                     (valid-answers No Yes))))






(defrule Answer-japan ""

   (logical (Japan Yes))
   
   =>

   (assert (UI-state (display "Matcha KitKat")
                     (state final))))

(defrule Answer-movie ""

   (logical (Movie Yes))
   
   =>

   (assert (UI-state (display "CookieDough")
                     (state final)))
	(assert (UI-state (display "Mike Ike")
                     (state final)))
	(assert (UI-state (display "Raisinets")
                     (state final)))
	(assert (UI-state (display "Goobers")
                     (state final)))
	(assert (UI-state (display "Sno Caps")
                     (state final)))
	(assert (UI-state (display "Junor Mints")
                     (state final))))

					 
(defrule Answer-depression ""

   (logical (depression Yes))

   =>

	(assert (UI-state (display "Mary Jane")
                     (state final)))
	(assert (UI-state (display "Pill-like candies")
                     (state final)))
	(assert (UI-state (display "Old Colorful Candies")
                     (state final)))
	(assert (UI-state (display "Chick-O-Stick")
                     (state final)))
	(assert (UI-state (display "Bit-O-Honey")
                     (state final))))


(defrule Answer-member ""

   (logical (member Yes))

   =>

   (assert (UI-state (display "Big Cup")
                     (state final)))
    (assert (UI-state (display "Chicken Dinner")
                     (state final))))

(defrule Answer-fair ""

   (logical (fair Yes))

   =>

   (assert (UI-state (display "Rock Candies")
                     (state final)))
	(assert (UI-state (display "Lollipop")
                     (state final)))
	(assert (UI-state (display "Cotton Candy")
                     (state final))))
   
(defrule Answer-teeth ""

   (logical (teeth No))
   
   =>

   (assert (UI-state (display "Caramel Lollipops")
                     (state final)))
	(assert (UI-state (display "Jujubes")
                     (state final)))
	(assert (UI-state (display "Milk Duds")
                     (state final)))
	(assert (UI-state (display "Dots")
                     (state final)))
	(assert (UI-state (display "Big Hunk")
                     (state final))))
   
(defrule Answer-thurgood ""

   (logical (Thurgood Yes))

   =>

   (assert (UI-state (display "Abba-Zaba")
                     (state final))))
                     
(defrule Answer-bucket ""
   
   (logical (Bucket Yes))
   
   =>


   (assert (UI-state (display "Wonka Bar")
                     (state final))))

(defrule Answer-machine ""

   (logical (machine Yes))
   
   =>

    (assert (UI-state (display "LifeSavers")
                     (state final)))
   (assert (UI-state (display "Rolo")
                     (state final))))
					 
(defrule Answer-chalk ""

   (logical (chalk Yes))
      
   =>

   (assert (UI-state (display "Smarties")
                     (state final)))
	(assert (UI-state (display "Whoppers")
                     (state final)))
	(assert (UI-state (display "Necco")
                     (state final))))
                     
(defrule  Answer-under ""

   (logical (under Yes))

   =>
  
   (assert (UI-state (display "Nerds")
                     (state final)))
	(assert (UI-state (display "Candy Spray")
                     (state final)))
	(assert (UI-state (display "Jawbreaker Candy")
                     (state final)))
	(assert (UI-state (display "Pixy Stix")
                     (state final)))
	(assert (UI-state (display "Candy Pacifiers")
                     (state final))))

(defrule  Answer-underNO ""

   (logical (under No))

   =>
  
   (assert (UI-state (display "Trolli")
                     (state final)))
	(assert (UI-state (display "WarHeads")
                     (state final)))
	(assert (UI-state (display "Now and Later")
                     (state final)))
	(assert (UI-state (display "Sour Patch")
                     (state final)))
	(assert (UI-state (display "Air Heads")
                     (state final)))
	(assert (UI-state (display "Laffy Taffy")
                     (state final)))
	(assert (UI-state (display "Pop Rocks")
                     (state final))))

(defrule  Answer-play ""

   (logical (play Yes))

   =>
  
   (assert (UI-state (display "FunDip")
                     (state final)))
	(assert (UI-state (display "PEZ")
                     (state final)))
	(assert (UI-state (display "Red Sour Gummies")
                     (state final))))

(defrule  Answer-rainbow ""

   (logical (rainbow Yes))

   =>
  
   (assert (UI-state (display "Skittles")
                     (state final))))

(defrule  Answer-rainbowNO ""

   (logical (rainbow No))

   =>
  
   (assert (UI-state (display "Lemonhead")
                     (state final)))
	(assert (UI-state (display "Starburst")
                     (state final)))
	(assert (UI-state (display "Fruit Candies")
                     (state final))))

(defrule  Answer-real ""

   (logical (real No))

   =>
  
   (assert (UI-state (display "Twizzlers")
                     (state final)))
	(assert (UI-state (display "Redvines")
                     (state final))))

(defrule  Answer-realYES ""

   (logical (real Yes))

   =>
  
   (assert (UI-state (display "Black Licorice Candies")
                     (state final)))
	(assert (UI-state (display "Good&Plenty")
                     (state final))))


(defrule  Answer-easter ""

   (logical (easter Yes))

   =>
  
   (assert (UI-state (display "Chocolate Rabbit")
                     (state final)))
	(assert (UI-state (display "Creme Egg")
                     (state final))))
					 
(defrule  Answer-diet ""

   (logical (diet Yes))

   =>
  
   (assert (UI-state (display "Fruit Snack")
                     (state final))))

(defrule  Answer-truck ""

   (logical (truck Yes))

   =>
  
   (assert (UI-state (display "Idaho Spud")
                     (state final)))
	(assert (UI-state (display "Nut Goodie")
                     (state final)))
	(assert (UI-state (display "GooGoo")
                     (state final)))
	(assert (UI-state (display "Cherry Mash")
                     (state final))))


(defrule  Answer-coconut ""

   (logical (coconut Yes))

   =>
  
   (assert (UI-state (display "AlmondJoy")
                     (state final)))
	(assert (UI-state (display "Mounds")
                     (state final))))
                     

(defrule  Answer-search ""

   (logical (search Yes))

   =>
  
   (assert (UI-state (display "Black Candy")
                     (state final)))
	(assert (UI-state (display "Gummy Bears")
                     (state final)))
	(assert (UI-state (display "Red Candy")
                     (state final)))
	(assert (UI-state (display "Colorful Candy")
                     (state final))))


(defrule  Answer-toothpaste ""

   (logical (paste Yes))

   =>
  
   (assert (UI-state (display "York")
                     (state final))))


(defrule  Answer-sundae ""

   (logical (sundae Yes))

   =>
  
   (assert (UI-state (display "Butterfinger")
                     (state final)))
	(assert (UI-state (display "Skor")
                     (state final)))
	(assert (UI-state (display "Heath")
                     (state final))))

(defrule  Answer-nothing ""

   (logical (nothing Yes))

   =>
  
   (assert (UI-state (display "Zero")
                     (state final)))
	(assert (UI-state (display "Clark")
                     (state final)))
	(assert (UI-state (display "5th Avenue")
                     (state final)))
	(assert (UI-state (display "100 Grand")
                     (state final)))
	(assert (UI-state (display "Zagnut")
                     (state final))))


(defrule  Answer-classic ""

   (logical (classic Yes))

   =>
  
   (assert (UI-state (display "M&m's")
                     (state final)))
   (assert (UI-state (display "Hershey's Milk Chocolate")
                     (state final)))
   (assert (UI-state (display "Hershey's Kisses")
                     (state final))))


(defrule  Answer-classicNO ""

   (logical (classic No))

   =>
  
   (assert (UI-state (display "Valomilk")
                     (state final)))
   (assert (UI-state (display "Sky Bar")
                     (state final)))
   (assert (UI-state (display "Charleston Chew")
                     (state final))))

(defrule  Answer-time ""

   (logical (time Yes))

   =>
  
   (assert (UI-state (display "Toblerone")
                     (state final)))
   (assert (UI-state (display "Dove")
                     (state final))))

(defrule  Answer-nuts ""

   (logical (nuts Yes))

   =>
  
   (assert (UI-state (display "NutRageous")
                     (state final)))
   (assert (UI-state (display "BabyRuth")
                     (state final)))
   (assert (UI-state (display "Snickers")
                     (state final)))
   (assert (UI-state (display "PayDay")
                     (state final)))
   (assert (UI-state (display "Mr.Goodbar")
                     (state final)))
   (assert (UI-state (display "Chunky")
                     (state final))))


(defrule  Answer-chocolate ""

   (logical (chocolate No))

   =>
  
   (assert (UI-state (display "Jelly Beans")
                     (state final)))
   (assert (UI-state (display "Hot Tamales")
                     (state final)))
   (assert (UI-state (display "Swedish Fish")
                     (state final)))
   (assert (UI-state (display "Gobstopper")
                     (state final))))

(defrule  Answer-bite ""

   (logical (bite Yes))

   =>
  
   (assert (UI-state (display "Crunch")
                     (state final)))
   (assert (UI-state (display "Hershey's Cookies'n'Creme")
                     (state final)))
   (assert (UI-state (display "KitKat")
                     (state final)))
   (assert (UI-state (display "Twix")
                     (state final))))

(defrule  Answer-mouth ""

   (logical (mouth Yes))

   =>
  
   (assert (UI-state (display "Take5")
                     (state final)))
   (assert (UI-state (display "Reese's Pieces")
                     (state final)))
   (assert (UI-state (display "Flipz")
                     (state final)))
   (assert (UI-state (display "Reese's")
                     (state final))))


(defrule  Answer-christmas ""

   (logical (christmas Yes))

   =>
  
   (assert (UI-state (display "Candy Cane")
                     (state final)))
   (assert (UI-state (display "See's Candies")
                     (state final)))
   (assert (UI-state (display "Ferrero Rocher")
                     (state final)))
  (assert (UI-state (display "Queen Anne")
                     (state final)))
   (assert (UI-state (display "Chocolate Orange")
                     (state final)))
   (assert (UI-state (display "Whitman's")
                     (state final))))

(defrule  Answer-christmasNO ""

   (logical (christmas No))

   =>
  
   (assert (UI-state (display "Tootsie Roll POP")
                     (state final)))
   (assert (UI-state (display "Caramello")
                     (state final)))
   (assert (UI-state (display "3 Musketeers")
                     (state final)))
  (assert (UI-state (display "WhatChaMaCallIt")
                     (state final)))
   (assert (UI-state (display "MilkyWay")
                     (state final))))






(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
