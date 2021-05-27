import { Component, OnInit } from '@angular/core';
import { CartService } from '../cart.service';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

	// items :any[] = [];
	customerId:any;
	total:any;

  constructor(public cartService: CartService, private route: ActivatedRoute) { }

  ngOnInit(): void {
  	this.customerId = Number(this.route.snapshot.paramMap.get('cId'));
  	this.cartService.getCartData(this.customerId).subscribe(res => {
  		this.cartService.cartData=res.cart_data
  		this.calcuateTotalAndSet()
  	})
  	
  }

  calcuateTotalAndSet(){
  	this.total = 0;
  	this.cartService.cartData.items.forEach((item: any) => {
  		this.total+= item.price*item.quantity
  	})
  }

  // fetchAndSetCart(){
  // 	this.cartService.getCartData(5).subscribe(res => {
  // 		this.items = res.cart_data.items;
  // 	})
  // }

}
