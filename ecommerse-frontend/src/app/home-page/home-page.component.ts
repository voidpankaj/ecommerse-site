import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-home-page',
  templateUrl: './home-page.component.html',
  styleUrls: ['./home-page.component.css']
})
export class HomePageComponent implements OnInit {

  constructor(private route:ActivatedRoute) { }
  customerId:any;

  ngOnInit(): void {
  	this.customerId = Number(this.route.snapshot.paramMap.get('cId'));
  }

}
