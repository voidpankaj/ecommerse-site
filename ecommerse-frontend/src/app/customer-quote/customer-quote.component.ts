import { Component, OnInit } from '@angular/core';
import { CustomerService } from '../customer.service';
import { ActivatedRoute } from '@angular/router';



@Component({
  selector: 'app-customer-quote',
  templateUrl: './customer-quote.component.html',
  styleUrls: ['./customer-quote.component.css']
})
export class CustomerQuoteComponent implements OnInit {

  constructor(public customerService: CustomerService, private route: ActivatedRoute) { }
  customerId:any;
  ngOnInit(): void {
  	this.customerId = Number(this.route.snapshot.paramMap.get('cId'));
  	this.fetchRequests();
  }

  fetchRequests(){
  	this.customerService.fetchQuotationRequests(this.customerId).subscribe(res => {
  		this.customerService.customerData = res.data
  	})
  }

  viewDetails(quote:any){
  	quote.show = !quote.show
  }

}
