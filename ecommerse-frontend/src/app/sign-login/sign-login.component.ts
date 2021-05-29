import { Component, OnInit } from '@angular/core';
import { ActivatedRoute,Router } from '@angular/router';


@Component({
  selector: 'app-sign-login',
  templateUrl: './sign-login.component.html',
  styleUrls: ['./sign-login.component.css']
})
export class SignLoginComponent implements OnInit {

	user:any ={};
  constructor(private router: Router) { }
  
  ngOnInit(): void {
  }

  goToHomePage(){
  	if(!this.user.id || !this.user.type){
  		alert("Please enter userId and select user type!!")
  		return
  	}
  	if(this.user.type == "Customer"){
  		this.router.navigate([`/collections/${this.user.id}`]);
  	}else{	
  		this.router.navigate([`/owner/qoute/${this.user.id}`]);
  	}
  }

}
