import { Component, OnInit } from '@angular/core';
import { Product } from '../product';
import { CartService } from '../cart.service';
import { CatalogService } from '../catalog.service';



@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

	products: any[] = [];
  constructor(private catalogService: CatalogService) { }

  ngOnInit(): void {
  	this.getHeroes();
  }

  getHeroes(): void {
  	this.catalogService.getItems().subscribe(res => {
  		this.products = res
  	})
	}

}
