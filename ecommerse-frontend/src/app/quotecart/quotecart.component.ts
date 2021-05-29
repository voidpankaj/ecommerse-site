import { Component, OnInit } from '@angular/core';
import { QuotecartService } from '../quotecart.service';
import { ActivatedRoute,Router } from '@angular/router';



@Component({
  selector: 'app-quotecart',
  templateUrl: './quotecart.component.html',
  styleUrls: ['./quotecart.component.css']
})
export class QuotecartComponent implements OnInit {

  constructor(public quotecartService: QuotecartService, private route:ActivatedRoute, private router: Router) { }
  customerId:any;
  total:any;
  comment:any;
  ngOnInit(): void {
  	this.customerId = Number(this.route.snapshot.paramMap.get('cId'));
  	this.quotecartService.getQouteCartData(this.customerId).subscribe(res => {
  		this.quotecartService.cartData = res.cart_data
  		if(res.cart_data){
  			this.calcuateTotalAndSet()
  		}
  	})
  }

  calcuateTotalAndSet(){
  	this.total = 0;
  	let items = this.quotecartService.cartData.items || []
  	items.forEach((item: any) => {
  		item.new_quantity = item.quantity
  		this.total+= item.quote_price*item.quantity
  	})
  }

  update(item: any){
  	item.quantity = item.new_quantity
  	var params = {"customer_id": this.customerId, "item_param": item}
  	this.quotecartService.addToQuoteCart(params).subscribe(data => {
			this.quotecartService.cartData = data.cart_data
			this.calcuateTotalAndSet()
		})
  }

  submitQuoteCart(){
  	var params = {"customer_id": this.customerId, "comment": this.comment}
  	this.quotecartService.submitQuoteCart(params).subscribe(res => {
  		alert(`You have submitted the quote request successfully. Your quote cart ID is ${res.cart_id}. Please wait for the store's response.`)
  		this.router.navigate([`/collections/${this.customerId}`]);
  	})
  }

}
