import { Injectable } from '@angular/core';
import { Product } from './product';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';



@Injectable({
  providedIn: 'root'
})

export class CartService {

	// private catalogsUrl = 'http://localhost:3000/ecommerse/api/catalogs.json?page=2&per_page=50';

	constructor(private http: HttpClient) { }

  items: any[] = [];

  addToCart(product: Product) {
    this.items.push(product);
  }

  getItems(){
  	return  this.items;
  }

  clearCart() {
    this.items = [];
    return this.items;
  }

  // getProduct(id: Number){
  // 	return this.items[id]
  // }
}
