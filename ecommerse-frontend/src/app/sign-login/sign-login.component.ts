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

  goToHomePage(id:any){
  	alert(id)
  	var url = `/collections/${id}`;
  	this.router.navigate([url]);
  }

}
