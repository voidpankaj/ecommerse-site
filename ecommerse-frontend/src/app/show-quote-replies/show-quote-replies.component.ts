// import { Component, OnInit, Input } from '@angular/core';
// import { CartService } from '../cart.service';
// import { ActivatedRoute } from '@angular/router';

// @Component({
// 	selector: 'app-product-details',
// 	templateUrl: './product-details.component.html',
// 	styleUrls: ['./product-details.component.css']
// })
// export class ProductDetailsComponent implements OnInit {

// 	@Input() product?: any;
// 	@Input() cId?: any;
// 	constructor(private cartService: CartService, private route: ActivatedRoute
// 		) { }
// 	ngOnInit(): void {
// 	}

import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-show-quote-replies',
  templateUrl: './show-quote-replies.component.html',
  styleUrls: ['./show-quote-replies.component.css']
})
export class ShowQuoteRepliesComponent implements OnInit {

	@Input() replies?: any;
  constructor() { }

  ngOnInit(): void {
  }

}
