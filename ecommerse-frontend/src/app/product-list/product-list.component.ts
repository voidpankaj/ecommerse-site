import { Component, OnInit } from '@angular/core';
import { Product } from '../product';
import { CartService } from '../cart.service';
import { CatalogService } from '../catalog.service';
import { ActivatedRoute } from '@angular/router';
import { CustomerService } from '../customer.service';



@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

	products: any[] = [];
	customerId: any;
  constructor(private catalogService: CatalogService, 
  	private route: ActivatedRoute,
  	private customerService: CustomerService,
  	private cartService: CartService) { }

  ngOnInit(): void {
  	this.customerId = Number(this.route.snapshot.paramMap.get('cId'));
  	this.getProducts();
  	this.cartService.getCartData(this.customerId).subscribe(data => {
  		this.cartService.cartData = data.cart_data
  	})
  }

  getProducts(): void {
  	this.customerService.getItems(this.customerId).subscribe(res => {
  		this.products = res
  	})
	}

}
