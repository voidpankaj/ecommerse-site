import { Component, OnInit, Input } from '@angular/core';
import { CartService } from '../cart.service';
import { ActivatedRoute } from '@angular/router';

@Component({
	selector: 'app-product-details',
	templateUrl: './product-details.component.html',
	styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit {

	@Input() product?: any;
	@Input() cId?: any;
	constructor(private cartService: CartService, private route: ActivatedRoute
		) { }
	ngOnInit(): void {
	}

	addToCart(item: any) {
		item.quantity = 1
		let items = this.cartService.cartData.items || []
		let cItem = items.find((c:any) => c.catalog_id == item.catalog_id);
		if(cItem){
			item.quantity+= cItem.quantity
		}
		var params = {"purchase_id": this.cartService.cartData.purchase_id, "customer_id": this.cId, "item_param": item}
		this.cartService.addToCart(params).subscribe(data => {
			this.cartService.cartData = data.cart_data
		})
		window.alert(`${item.title} has been added to the cart!`);
	}



	// getHero(): void {
	// 	const id = Number(this.route.snapshot.paramMap.get('id'));
	// 	this.cartService.getProduct(id)
	// 	.subscribe(product => this.product = product);
	// }

}

