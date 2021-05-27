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
	constructor(private cartService: CartService, private route: ActivatedRoute
		) { }
	ngOnInit(): void {
	}

	addToCart(item: any) {
		this.cartService.addToCart(item);
		window.alert('Your product has been added to the cart!');
	}

	// getHero(): void {
	// 	const id = Number(this.route.snapshot.paramMap.get('id'));
	// 	this.cartService.getProduct(id)
	// 	.subscribe(product => this.product = product);
	// }

}

