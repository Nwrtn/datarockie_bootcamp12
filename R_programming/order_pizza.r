## PIZZA RESTAURANT

order_pizza <- function() {
  menus <- c(
    "seafood" = 199, 
    "hawaiian" = 159, 
    "pepperoni" = 169, 
    "margherita" = 179, 
    "french fries" = 65, 
    "cola" = 40)
  cust_order <- data.frame(
    item = character(),
    qty = integer(),
    price = integer()
  )

  ## ทักทายลูกค้า
  print("Hello!")
  cust_name <- readline("What is your name? ")
  print(paste0("Welcome to our online pizzeria, " , cust_name))
  
  while (TRUE) {
    order_now <- readline("Would you like to order now? (yes/no) : ")
    if (order_now == "no") {
      cat("See you later.")
      return(invisible(FALSE))
    } else if(!(order_now == "yes")) {
      cat("Please answer yes or no")
    } else {
      break
    }
  }

  ## บอกว่ามีกี่เมนู
  cat("--------MENU--------\n")
  for (m in seq_along(menus)) {
    cat(m,names(menus)[m],"price",menus[m],"baht\n")
  }

  ## ให้ลูกค้ากรอกข้อมูลพิซซาที่ต้องการ
  while (TRUE) {
    item <- readline("What would you like to have?: ")
    if (!(item %in% names(menus))) {
      cat("We don't have that menus")
      next
    }
    qty <- as.integer(readline("How many?: "))
    if (is.na(qty) || qty <= 0) {
      cat("please enter number greater than 0")
    }
    pizza_price <- menus[item]
    current_order <- data.frame(
      item = item,
      qty = qty,
      price = pizza_price
    )
    
    cust_order <- rbind(cust_order, current_order)
    
    ask_more_order <- readline("Anything else? (yes/no): ")
    if (ask_more_order == "no"){
      break
    }
  }

  ## สรุปรายการที่สั่งและรวมราคา
  cat("--------ORDER BILL--------\n")
  print(cust_order, row.names = FALSE)
  total_cost <- sum(cust_order$qty * cust_order$price)
  cat("Total:", total_cost,"baht")
}


## ใช้งานฟังก์ชัน
order_pizza()
