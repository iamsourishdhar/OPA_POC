package mydatabase.policy


import input



default allow = true

headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}



user_response = http.send(
  {
  "method": "get",
  "url": "http://localhost:9118/allusers/AP101",
  "headers": headers
  
  }
)


showAll[result]{
	result= user_response.body[_].userDetailsList[_]
}




allow {    
	
	some i,j
	user_response.body[_].userDetailsList[i].emailId==input.emailId		
	user_response.body[_].userDetailsList[i].userAccessDetailsList[j].resourceCode==input.resource
	user_response.body[_].userDetailsList[i].userAccessDetailsList[j].roleCode==input.role
	
}

