import { Component, OnInit } from '@angular/core';
import { CartService } from '../cart.service';
import { ActivatedRoute } from '@angular/router';
import { QuotecartService } from '../quotecart.service';



@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

	customerId:any;
	total:any;

  constructor(public cartService: CartService, private route: ActivatedRoute, private quotecartService: QuotecartService) { }

  ngOnInit(): void {
  	this.customerId = Number(this.route.snapshot.paramMap.get('cId'));
  	this.cartService.getCartData(this.customerId).subscribe(res => {
  		this.cartService.cartData=res.cart_data
  		if(res.cart_data){
  			this.calcuateTotalAndSet()
  		}
  	})
  	this.quotecartService.getQouteCartData(this.customerId).subscribe(res => {
  		this.quotecartService.cartData = res.cart_data
  	})
  }

  calcuateTotalAndSet(){
  	this.total = 0;
  	this.cartService.cartData.items.forEach((item: any) => {
  		item.new_quantity = item.quantity
  		this.total+= item.price*item.quantity
  	})
  }

  update(item: any){
  	item.quantity = item.new_quantity
  	var params = {"purchase_id": this.cartService.cartData.purchase_id, "customer_id": this.customerId, "item_param": item}
  	this.cartService.addToCart(params).subscribe(data => {
			this.cartService.cartData = data.cart_data
			this.calcuateTotalAndSet()
		})
  }

  moveToQuote(item: any){
  	this.quotecartService.cartData ||= {}
		let items = this.quotecartService.cartData.items || []
		let qItem = items.find((c:any) => c.order_item_id == item.order_item_id);
		if(qItem){
			item.quantity+= qItem.quantity
		}
  	item.quote_price = item.price
  	var params = {"customer_id": this.customerId, "item_param": item}
  	this.quotecartService.addToQuoteCart(params).subscribe(data => {
  		this.quotecartService.cartData = data.cart_data
  	})
  	window.alert(`${item.title} has been added to the Quote Cart!`);
  }

}
